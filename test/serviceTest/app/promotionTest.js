/**
 * Created by lucywu on 11/21/14.
 */
var promotionService   = require("../../../service/app/promotionService");

var cb=function(err,msg){
    console.log(err);
    console.log(msg);
}

var options=[
    {"ITEMCODE":"1525230","COUNTERCODE":"000222",NUM:5},
    {"ITEMCODE":"1525231","COUNTERCODE":"000333",NUM:3},
    {"ITEMCODE":"1525232","COUNTERCODE":"000222",NUM:1},
    {"ITEMCODE":"1525233","COUNTERCODE":"000333",NUM:2}
]
promotionService.process(false,options,cb);

promotionService.process(false,[],cb);