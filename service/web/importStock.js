/**
 * Created by Legend on 2015/4/29.
 */
var excelParser = require('excel-parser');
var sequelize = require('../../dao/_sequelize');
var async = require('async');
var generalDAO = require("../../dao/generalDAO");
var stockService= require("./stockService");
var mec_itm_stockDAO=require("../../dao/mec_itm_stockDAO");

function trim(str){ //删除左右两端的空格
    return str.replace(/(^\s*)|(\s*$)/g, "");
}

//判断是否是正整数
function IsNum(s)
{
    if(s!=null){
        var r,re;
        re = /\d*/i; //\d表示数字,*表示匹配多个数字
        r = s.match(re);
        return (r==s)?true:false;
    }
    return false;
}

function getSKCCode(msg,mskc){
    for(var i=0;i<msg.length;i++){
        if(msg[i]['MERCHANTSKCCODE']==mskc){
            return msg[i]['SKCCODE'];
        }
    }
    return '000000';
}

exports.importStock=function(filepath, brandcode,countercode, assitantid, cb){
    excelParser.parse({
        inFile: '../excelfiles/'+filepath,
        worksheet: 1,
        skipEmpty: false
    },function(err, records){
        if(err) {
            console.error(err);
            cb(err,null);
            return;
        }
        var index=3;
        var skcs=[];
        var stockops=[];
        var errtext='';
        for(index=1;records[index];index++){
            if(records[index][0]=='※贵宾卡状态:"0"表示开,"-1"表示关;'){
                console.log("Finish");
                break;
            }
            records[index][0]=trim(records[index][0]);
            records[index][1]=trim(records[index][1]);
            //records[index][2]=trim(records[index][2]);
            if(records[index][0]!=''||records[index][1]!=''){
                if(records[index][0]==''||records[index][1]==''){
                    errtext+='第'+(index+1)+'行缺少必要的信息\n';
                }else{
                    var itemop={};
                    var skc=records[index][0];
                    if(skc.indexOf('.0')!=-1&&skc.indexOf('.0')==skc.length-2){
                        skc=skc.substring(0,skc.indexOf('.0'));
                    }
                    if(skcs.indexOf(skc)!=-1){
                        errtext+="第"+(index+1)+'行的SKC码'+skc+"和前面的SKC码有重复\n";
                    }
                    itemop['SKC']=skc;
                    var num=records[index][1];
                    if(num.indexOf('.0')!=-1&&num.indexOf('.0')==num.length-2){
                        num=num.substring(0,num.indexOf('.0'));
                    }
                    if(!IsNum(num)){
                        errtext+="第"+(index+1)+'行库存不是正整数\n';
                    }
                    itemop['NUM']=num;
                    stockops.push(itemop);
                    skcs.push(skc);
                }
            }else{
                if(records[index+1][0]=='※贵宾卡状态:"0"表示开,"-1"表示关;'||records[index+1][0]==''&&records[index+1][1]==''&&records[index][2]==''){
                    break;
                }
            }
        }
        if(errtext.length>0){
            cb(errtext,null);
            return;
        }
        //开始查询数据库并执行更新操作
        async.waterfall([
            //检测Excel中的SKC是否都存在
            function(cb){
                var skcodes='(';
                for(var i=0;i<skcs.length;i++){
                    if(i!=skcs.length-1){
                        skcodes+=skcs[i]+',';
                    }else{
                        skcodes+=skcs[i];
                    }
                }
                skcodes+=')';
                generalDAO.runSql('select skc.SKCCODE, skc.MERCHANTSKCCODE from mec_itm_skc as skc, mec_itm_item as sku where sku.BRANDCODE='+brandcode+' and skc.ITEMCODE=sku.ITEMCODE and skc.MERCHANTSKCCODE in '+skcodes,function(err,msg){
                    if(msg.length==skcs.length){
                        for(var i=0;i<stockops.length;i++){
                            stockops[i]['SKCCODE']=getSKCCode(msg,stockops[i]['SKC']);
                        }
                        cb(null);
                        //cb(null,msg);
                    }else{
                        var err="以下供应商编码的商品部存在：\n";
                        for(var i=0;i<msg.length;i++){
                            skcs.splice(skcs.indexOf(msg[i]['MERCHANTSKCCODE']),1);
                        }
                        for(var j=0;j<skcs.length;j++){
                            err+=skcs[j]+'\n';
                        }
                        cb(err);
                    }
                });
            },
            //执行更新操作
            function(cb){
                sequelize.transaction({
                    autocommit:false
                },function(t){
                    async.forEach(stockops,function(item,cb){
                        //if(item['OP']=='-'){
                        //    stockService.decreaseStock(countercode,item['SKCCODE'],item['NUM'],assitantid,function(err,msg){
                        //        if(err){
                        //            cb(item['SKC']+"退货失败"+err);
                        //        }else{
                        //            cb(null);
                        //        }
                        //    });
                        //}else{
                        //    stockService.increaseStock(countercode,item['SKCCODE'],item['NUM'],assitantid,function(err,msg){
                        //        if(err){
                        //            cb(item['SKC']+"进货失败"+err);
                        //        }else{
                        //            cb(null);
                        //        }
                        //    });
                        //}

                        mec_itm_stockDAO.queryOne({where:{COUNTERCODE:countercode,SKCCODE:item['SKCCODE']}},t,function(err,msg){
                            if(err){
                                cb('检查条目是否存在出错了');
                            }else if(!msg){
                                var obj={
                                    COUNTERCODE:countercode,
                                    SKCCODE:item['SKCCODE'],
                                    AMOUNT:item['NUM'],
                                    LASTOPERATEPERSON:assitantid
                                }
                                mec_itm_stockDAO.add(obj,cb);
                            }else{
                                mec_itm_stockDAO.update({AMOUNT:item['NUM'],LASTOPERATEPERSON:assitantid},{COUNTERCODE:countercode,SKCCODE:item['SKCCODE'],RECORDSTATE:1},t,function(err,msg){
                                    if(err){
                                        cb(item['SKC']+"库存更新失败"+err);
                                    }else{
                                        cb(null);
                                    }
                                });
                            }
                        });
                    },function(err){
                        if(err){
                            t.rollback();
                            cb("执行某个更新出现问题:"+err+'\n');
                        }else{
                            t.commit();
                            cb(null);
                        }
                    });
                });
            }
        ],function(err){
            if(err){
                cb(err,null);
            }else{
                cb(null,stockops);
            }
        });
    });
}