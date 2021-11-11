mysql = require 'mysql'
queuedo = require 'queuedo'
fs = require 'fs'
path = require 'path'
config = require '../config/mysqlConfig.json'
config = config.dev
database = config.database
modelsPath = "../model/"
result = {}

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
      result[tableName] = {}
      _results.forEach (r)->
        result[tableName][r.Field] =
          type: r.Type
          allowNull: if r.Null == "YES" then true else false
          primaryKey: if r.Key == "PRI" then true else false
          comment: r.Comment || null
        if((r.Null == "YES" || r.Default != null) &&(r.Field!='createdAt' && r.Field!='updatedAt')) then result[tableName][r.Field]["defaultValue"] = r.Default #不能allowNull=false但是defaultValue=null
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
        if(table_name.indexOf("sym_") == 0 || table_name.indexOf("test_") == 0) then continue;
        targetPath = path.join(modelsPath, table_name + ".json")
        fs.writeFileSync targetPath, JSON.stringify(result[table_name], null, 2)
        cCount++
        console.log 'create success : ' + targetPath
      console.log 'total models :' + cCount
      connection.end()