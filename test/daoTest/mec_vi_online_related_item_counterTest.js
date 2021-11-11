var mec_vi_online_related_item_counterDAO = require("../../dao/mec_vi_online_related_item_counterDAO");

mec_vi_online_related_item_counterDAO.queryOne({where:{}},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_online_related_item_counterDAO.queryAll({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})

mec_vi_online_related_item_counterDAO.queryAndCount({},function(err,msg){
    if(err) console.log(err);
    else console.log(msg);
})
