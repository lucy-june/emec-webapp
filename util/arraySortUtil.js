/**
 * Created by lucywu on 5/27/14.
 * 数组排序
 */

exports.arraySortBy = function(name){
    return function(o, p){
        var a, b;
        if (typeof o === "object" && typeof p === "object" && o && p) {
            a = o[name];
            b = p[name];
            if (a === b) {
                return 0;
            }
            if (typeof a === typeof b) {
                return a > b ? -1 : 1;
            }
            return typeof a > typeof b ? -1 : 1;
        }
        else {
            throw ("error");
        }
    }
}

exports.by=by;
var by = function(name,minor)
{
    return function(o, p)
    {
        var a, b;
        if (typeof o === "object" && typeof p === "object" && o && p)
        {
            a = o[name];
            b = p[name];
            if (a === b) {return typeof minor==='function' ?minor(o,p):0;}
            if (typeof a === typeof b) { return a < b ? -1 : 1;}
            return typeof a < typeof b ? -1 : 1;
        }
        else {throw ("error"); }
    }
}

//var employees=[]
//employees[0]={name:"George", age:32, retiredate:"March 12, 2014"}
//employees[1]={name:"Edward", age:17, retiredate:"June 2, 2023"}
//employees[2]={name:"Christine", age:58, retiredate:"December 20, 2036"}
//employees[3]={name:"Sarah", age:62, retiredate:"April 30, 2020"}
//employees[4]={name:"ZSarah", age:62, retiredate:"April 30, 2020"}
//employees[5]={name:"0Sarah", age:62, retiredate:"April 30, 2020"}
//employees.sort(by('age',by('name')));
//console.log(employees);