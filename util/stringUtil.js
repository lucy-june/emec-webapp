/**
 * Created by lucywu on 10/22/14.
 */

//对象转sql字符串
exports.optionsToSqlString=function(options){
    var str="";
    var keys= Object.keys(options);
    for(var k=0;k<keys.length;k++){
        var key=keys[k];
        var value=options[key];
        if(typeof(value)=="number"){
            str+=key+" = "+value+" and ";
        }
        if(typeof(value)=="string"){
            str+=key+" = '"+value+"' and ";
        }
        if(typeof(value)=="object"){
            str+=key+" in "+JSON.stringify(value).replace("[","(").replace("]",")")+" and ";
        }
    }
    if(str.length!=0) str=str.substr(0,str.length-4);
    return str;
}

//数字货字符串首部自动补全
exports.autoComple = function(content,len,symbol){
    if(typeof(content)=="object") return null;
    if(typeof (content)=="number") content=content.toString();
    var restLen=len-content.length;
    if(restLen<=0) return content;
    var tbl=[];
    if (!tbl[restLen]) tbl[restLen] = (new Array(restLen + 1)).join(symbol);
    return tbl[restLen] + content;
}


//字符串的正整数hash
exports.hashNumber = function(str,len){
    var bases=[1,7,97,997,9973,99991,999983];
    var base=bases[len];
    var hash=0;
    for(var k=0;k<str.length;k++){
        hash=(hash+str[k].charCodeAt())%base;
    }
    return hash;
}


//console.log(exports.hashNumber("蓝色",3));
//console.log(exports.hashNumber("红色",3));
//console.log(exports.hashNumber("红色中国结",3));
//console.log(exports.hashNumber("170",3));
//console.log(exports.hashNumber("180cm",3));
//console.log(exports.autoComple(3434,8,"#"));
//var options={DEPTCODE:"10201",COUNTERCODE:"000430",STATE:[1,3,4,5],POSITION:"dfg",a:0};
//console.log(JSON.stringify(options));
//console.log(typeof(options.STATE));
//console.log(typeof(options.DEPTCODE));
//console.log(typeof(options.a));
//console.log(exports.optionsToSqlString(options));