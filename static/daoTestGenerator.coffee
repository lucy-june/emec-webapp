mysql = require 'mysql'
queuedo = require 'queuedo'
fs = require 'fs'
path = require 'path'
config = require '../config/mysqlConfig.json'
config = config.dev
database = config.database
daoTestPath = "../test/daoTest/"
result={}


template1 =
  "var TABLENAMEDAO = require(\"../../dao/TABLENAMEDAO\");\n"+
  "var async = require('async');\n"+
  "var sequelize = require('../../dao/_sequelize');\n"+
  "\n"+
  "TABLENAMEDAO.queryOne({where:{}},function(err,msg){\n"+
  "    if(err) console.log(err);\n"+
  "    else console.log(msg);\n"+
  "})\n"+
  "\n"+
  "TABLENAMEDAO.queryAll({},function(err,msg){\n"+
  "    if(err) console.log(err);\n"+
  "    else console.log(msg);\n"+
  "})\n"+
  "\n"+
  "TABLENAMEDAO.queryAndCount({},function(err,msg){\n"+
  "    if(err) console.log(err);\n"+
  "    else console.log(msg);\n"+
  "})\n"+
  "\n"+
  "//TABLENAMEDAO.add({},function(err,msg){\n"+
  "//    if(err) console.log(err);\n"+
  "//    else console.log(msg);\n"+
  "//})\n"+
  "//\n"+
  "//TABLENAMEDAO.del({},function(err,msg){\n"+
  "//    if(err) console.log(err);\n"+
  "//    else console.log(msg);\n"+
  "//})\n"+
  "//\n"+
  "//TABLENAMEDAO.update({},{},function(err,msg){\n"+
  "//    if(err) console.log(err);\n"+
  "//    else console.log(msg);\n"+
  "//})";


template2 =
  "var TABLENAMEDAO = require(\"../../dao/TABLENAMEDAO\");\n"+
  "var async = require('async');\n"+
  "var sequelize = require('../../dao/_sequelize');\n"+
  "\n"+
  "TABLENAMEDAO.queryOne({where:{}},function(err,msg){\n"+
  "    if(err) console.log(err);\n"+
  "    else console.log(msg);\n"+
  "})\n"+
  "\n"+
  "TABLENAMEDAO.queryAll({},function(err,msg){\n"+
  "    if(err) console.log(err);\n"+
  "    else console.log(msg);\n"+
  "})\n"+
  "\n"+
  "TABLENAMEDAO.queryAndCount({},function(err,msg){\n"+
  "    if(err) console.log(err);\n"+
  "    else console.log(msg);\n"+
  "})\n";



connection = mysql.createConnection({
  host: config.host,
  user: config.username,
  password: config.password
});



connection.connect()


connection.query 'use ' + database + ';'



createTableInfo = (tableName, callback)->
  connection.query 'show full columns from ' + tableName + ';', (error, _results) ->
    if error then throw error
    else
      if(tableName.indexOf("mec_vi_")== 0)
        result[tableName] = template2.replace(/TABLENAME/g,tableName)
      else result[tableName] =
        template1.replace(/TABLENAME/g,tableName)
      callback()


connection.query 'show tables;', (error, _results) ->
  if error then throw error
  else
    queuedo _results, (cx, next, context)->
      tableName = cx['Tables_in_' + database]
      createTableInfo tableName, ()->
        next.call(context)
    , ()->
      cCount = 0
      for table_name of result
#        console.log "============"
#        console.log table_name
#        console.log table_name.indexOf("sym_")
#        console.log "$$$$$$$$$$$$$"
        if(table_name.indexOf("sym_") == 0||table_name.indexOf("test_") == 0) then continue;
        targetPath = path.join(daoTestPath, table_name + "Test.js")
        fs.writeFileSync targetPath, result[table_name]
        cCount++
        console.log 'create success : ' + targetPath
      console.log 'total daos :' + cCount
      connection.end()