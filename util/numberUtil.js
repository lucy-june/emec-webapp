/**
 * Created by lucywu on 3/11/15.
 *
 */

//制保留1位小数，如：1，会在1后面补上0.即1.0，返回为格式化的string类型
exports.round1=function(x){
    var f = parseFloat(x);
    if (isNaN(f)) {
        return false;
    }
    var f = Math.round(x*10)/10;
    var s = f.toString();//转化为string类型
    var rs = s.indexOf('.');
    if (rs < 0) {
        rs = s.length;
        s += '.';
    }
    while (s.length <= rs + 1) {
        s += '0';
    }
    return s;
}


//制保留2位小数，如：2，会在2后面补上00.即2.00
exports.round2=function(x) {
    var f = parseFloat(x);
    if (isNaN(f)) {
        return false;
    }
    var f = Math.round(x*100)/100;
    var s = f.toString();
    var rs = s.indexOf('.');
    if (rs < 0) {
        rs = s.length;
        s += '.';
    }
    while (s.length <= rs + 2) {
        s += '0';
    }
    return s;
}

//制保留1位小数，舍尾
exports.floor1=function(x){
    var f = parseFloat(x);
    if (isNaN(f)) {
        return false;
    }
    var f = Math.floor(x*10)/10;
    var s = f.toString();
    var rs = s.indexOf('.');
    if (rs < 0) {
        rs = s.length;
        s += '.';
    }
    while (s.length <= rs + 1) {
        s += '0';
    }
    return s;
}


//制保留2位小数，舍尾
exports.floor2=function(x) {
    var f = parseFloat(x);
    if (isNaN(f)) {
        return false;
    }
    var f = Math.floor(x*100)/100;
    var s = f.toString();
    var rs = s.indexOf('.');
    if (rs < 0) {
        rs = s.length;
        s += '.';
    }
    while (s.length <= rs + 2) {
        s += '0';
    }
    return s;
}
