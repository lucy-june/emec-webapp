mysql = require 'mysql'
queuedo = require 'queuedo'
fs = require 'fs'
path = require 'path'
config = require '../config/mysqlConfig.json'
config = config.dev
database = config.database
daosPath = "../dao/"
result={}


template1 = "//根据系统环境载入我们的配置\n" +
  "var node_env        = process.env.NODE_ENV ? process.env.NODE_ENV : 'dev';\n" +
  "var config          = require('../config/mysqlConfig.json')[node_env];\n" +
  "var sequelize       = require('./_sequelize');\n" +
#  "var myLogger    = require('../logging/contextLogger')('TABLENAMEDAO');\n" +
  "\n" +
  "var model= require('../model/TABLENAME.json');\n" +
  "var table = sequelize.define('TABLENAME',model,{freezeTableName:true,createdAt:false,updatedAt:false});\n" +
  "\n" +
  "exports.table=table;\n" +
  "\n" +
  "//查1个\n" +
  "exports.queryOne = function(qry,tran,lock,cb){\n" +
  "    var options={raw:true};\n" +
  "    if(typeof(tran)!='function'){\n" +
  "        if(tran) options.transaction=tran;\n" +
  "        if(typeof(lock)!='function'){\n" +
  "            if(lock) options.lock=lock;\n" +
  "        }\n" +
  "        else{\n" +
  "            cb=lock;\n" +
  "        }\n" +
  "    } else{\n" +
  "        cb=tran;\n" +
  "    }\n" +
  "    \n" +
  "    table.find(qry, options).success(function(res){\n" +
  "        cb(null,res);\n" +
  "    }).error(function (err) {\n" +
#  "       myLogger.error(err);\n" +
  "        cb(err,null);\n" +
  "    })\n" +
  "}\n" +
  "\n" +
  "//查\n" +
  "exports.queryAll = function(qry,tran,lock,cb){\n" +
  "    var options={raw:true};\n" +
  "    if(typeof(tran)!='function'){\n" +
  "        if(tran) options.transaction=tran;\n" +
  "        if(typeof(lock)!='function'){\n" +
  "            if(lock) options.lock=lock;\n" +
  "        }\n" +
  "        else{\n" +
  "            cb=lock;\n" +
  "        }\n" +
  "    } else{\n" +
  "        cb=tran;\n" +
  "    }\n" +
  "    table.findAll(qry, options).success(function(res){\n" +
  "        cb(null,res);\n" +
  "    }).error(function (err) {\n" +
#  "        myLogger.error(err);\n" +
  "        cb(err,null);\n" +
  "    })\n" +
  "}\n" +
  "\n" +
  "//查并计数全部\n" +
  "exports.queryAndCount = function(qry,tran,lock,cb){\n" +
  "    var options={raw:true};\n" +
  "    if(typeof(tran)!='function'){\n" +
  "        if(tran) options.transaction=tran;\n" +
  "        if(typeof(lock)!='function'){\n" +
  "            if(lock) options.lock=lock;\n" +
  "        }\n" +
  "        else{\n" +
  "            cb=lock;\n" +
  "        }\n" +
  "    } else{\n" +
  "        cb=tran;\n" +
  "    }\n" +
  "    table.findAndCountAll(qry, options).success(function(res){\n" +
  "        cb(null,res);\n" +
  "    }).error(function (err) {\n" +
#  "        myLogger.error(err);\n" +
  "        cb(err,null);\n" +
  "    })\n" +
  "}\n" +
  "\n" +
  "//增\n" +
  "exports.add = function(value,tran,lock,cb){\n" +
  "    var options={};\n" +
  "    if(typeof(tran)!='function'){\n" +
  "        if(tran) options.transaction=tran;\n" +
  "        if(typeof(lock)!='function'){\n" +
  "            if(lock) options.lock=lock;\n" +
  "        }\n" +
  "        else{\n" +
  "            cb=lock;\n" +
  "        }\n" +
  "    } else{\n" +
  "        cb=tran;\n" +
  "    }\n" +
  "    table.create(value,options).success(function(res){\n" +
  "        cb(null,res);\n" +
  "    }).error(function (err) {\n" +
#  "        myLogger.error(err);\n" +
  "        cb(err,null);\n" +
  "    })\n" +
  "}\n" +
  "\n" +
  "//删\n" +
  "exports.del = function(where,tran,lock,cb){\n" +
  "    var options={};\n" +
  "    if(typeof(tran)!='function'){\n" +
  "        if(tran) options.transaction=tran;\n" +
  "        if(typeof(lock)!='function'){\n" +
  "            if(lock) options.lock=lock;\n" +
  "        }\n" +
  "        else{\n" +
  "            cb=lock;\n" +
  "        }\n" +
  "    } else{\n" +
  "        cb=tran;\n" +
  "    }\n" +
  "    table.destroy(where, options).success(function(res){\n" +
  "        cb(null,res);\n" +
  "    }).error(function (err) {\n" +
#  "        myLogger.error(err);\n" +
  "        cb(err,null);\n" +
  "    })\n" +
  "}\n" +
  "\n" +
  "//改\n" +
  "exports.update = function(value,where,tran,lock,cb){\n" +
  "    var options={};\n" +
  "    if(typeof(tran)!='function'){\n" +
  "        if(tran) options.transaction=tran;\n" +
  "        if(typeof(lock)!='function'){\n" +
  "            if(lock) options.lock=lock;\n" +
  "        }\n" +
  "        else{\n" +
  "            cb=lock;\n" +
  "        }\n" +
  "    } else{\n" +
  "        cb=tran;\n" +
  "    }\n" +
  "    table.update(value, where, options).success(function(res){\n" +
  "        cb(null,res);\n" +
  "    }).error(function (err) {\n" +
#  "        myLogger.error(err);\n" +
  "        cb(err,null);\n" +
  "    })\n" +
  "}\n";


template2 = "//根据系统环境载入我们的配置\n" +
  "var node_env        = process.env.NODE_ENV ? process.env.NODE_ENV : 'dev';\n" +
  "var config          = require('../config/mysqlConfig.json')[node_env];\n" +
  "var sequelize       = require('./_sequelize');\n" +
#  "var myLogger    = require('../logging/contextLogger')('TABLENAMEDAO');\n" +
  "\n" +
  "var model= require('../model/TABLENAME.json');\n" +
  "var table = sequelize.define('TABLENAME',model,{freezeTableName:true});\n" +
  "\n" +
  "exports.table=table;\n" +
  "\n" +
  "//查1个\n" +
  "exports.queryOne = function(qry,tran,lock,cb){\n" +
  "    var options={raw:true};\n" +
  "    if(typeof(tran)!='function'){\n" +
  "        if(tran) options.transaction=tran;\n" +
  "        if(typeof(lock)!='function'){\n" +
  "            if(lock) options.lock=lock;\n" +
  "        }\n" +
  "        else{\n" +
  "            cb=lock;\n" +
  "        }\n" +
  "    } else{\n" +
  "        cb=tran;\n" +
  "    }\n" +
  "    \n" +
  "    table.find(qry, options).success(function(res){\n" +
  "        cb(null,res);\n" +
  "    }).error(function (err) {\n" +
#  "        myLogger.error(err);\n" +
  "        cb(err,null);\n" +
  "    })\n" +
  "}\n" +
  "\n" +
  "//查\n" +
  "exports.queryAll = function(qry,tran,lock,cb){\n" +
  "    var options={raw:true};\n" +
  "    if(typeof(tran)!='function'){\n" +
  "        if(tran) options.transaction=tran;\n" +
  "        if(typeof(lock)!='function'){\n" +
  "            if(lock) options.lock=lock;\n" +
  "        }\n" +
  "        else{\n" +
  "            cb=lock;\n" +
  "        }\n" +
  "    } else{\n" +
  "        cb=tran;\n" +
  "    }\n" +
  "    table.findAll(qry, options).success(function(res){\n" +
  "        cb(null,res);\n" +
  "    }).error(function (err) {\n" +
#  "        myLogger.error(err);\n" +
  "        cb(err,null);\n" +
  "    })\n" +
  "}\n" +
  "\n" +
  "//查并计数全部\n" +
  "exports.queryAndCount = function(qry,tran,lock,cb){\n" +
  "    var options={raw:true};\n" +
  "    if(typeof(tran)!='function'){\n" +
  "        if(tran) options.transaction=tran;\n" +
  "        if(typeof(lock)!='function'){\n" +
  "            if(lock) options.lock=lock;\n" +
  "        }\n" +
  "        else{\n" +
  "            cb=lock;\n" +
  "        }\n" +
  "    } else{\n" +
  "        cb=tran;\n" +
  "    }\n" +
  "    table.findAndCountAll(qry, options).success(function(res){\n" +
  "        cb(null,res);\n" +
  "    }).error(function (err) {\n" +
#  "        myLogger.error(err);\n" +
  "        cb(err,null);\n" +
  "    })\n" +
  "}\n" +
  "\n" +
  "//增\n" +
  "exports.add = function(value,tran,lock,cb){\n" +
  "    var options={};\n" +
  "    if(typeof(tran)!='function'){\n" +
  "        if(tran) options.transaction=tran;\n" +
  "        if(typeof(lock)!='function'){\n" +
  "            if(lock) options.lock=lock;\n" +
  "        }\n" +
  "        else{\n" +
  "            cb=lock;\n" +
  "        }\n" +
  "    } else{\n" +
  "        cb=tran;\n" +
  "    }\n" +
  "    table.create(value,options).success(function(res){\n" +
  "        cb(null,res);\n" +
  "    }).error(function (err) {\n" +
#  "        myLogger.error(err);\n" +
  "        cb(err,null);\n" +
  "    })\n" +
  "}\n" +
  "\n" +
  "//删\n" +
  "exports.del = function(where,tran,lock,cb){\n" +
  "    var options={};\n" +
  "    if(typeof(tran)!='function'){\n" +
  "        if(tran) options.transaction=tran;\n" +
  "        if(typeof(lock)!='function'){\n" +
  "            if(lock) options.lock=lock;\n" +
  "        }\n" +
  "        else{\n" +
  "            cb=lock;\n" +
  "        }\n" +
  "    } else{\n" +
  "        cb=tran;\n" +
  "    }\n" +
  "    table.destroy(where, options).success(function(res){\n" +
  "        cb(null,res);\n" +
  "    }).error(function (err) {\n" +
#  "        myLogger.error(err);\n" +
  "        cb(err,null);\n" +
  "    })\n" +
  "}\n" +
  "\n" +
  "//改\n" +
  "exports.update = function(value,where,tran,lock,cb){\n" +
  "    var options={};\n" +
  "    if(typeof(tran)!='function'){\n" +
  "        if(tran) options.transaction=tran;\n" +
  "        if(typeof(lock)!='function'){\n" +
  "            if(lock) options.lock=lock;\n" +
  "        }\n" +
  "        else{\n" +
  "            cb=lock;\n" +
  "        }\n" +
  "    } else{\n" +
  "        cb=tran;\n" +
  "    }\n" +
  "    table.update(value, where, options).success(function(res){\n" +
  "        cb(null,res);\n" +
  "    }).error(function (err) {\n" +
#  "        myLogger.error(err);\n" +
  "        cb(err,null);\n" +
  "    })\n" +
  "}\n";


template3 = "//根据系统环境载入我们的配置\n" +
  "var node_env        = process.env.NODE_ENV ? process.env.NODE_ENV : 'dev';\n" +
  "var config          = require('../config/mysqlConfig.json')[node_env];\n" +
  "var sequelize       = require('./_sequelize');\n" +
#  "var myLogger    = require('../logging/contextLogger')('TABLENAMEDAO');\n" +
  "\n" +
  "var model= require('../model/TABLENAME.json');\n" +
  "var table = sequelize.define('TABLENAME',model,{freezeTableName:true,createdAt:false,updatedAt:false});\n" +
  "\n" +
  "exports.table=table;\n" +
  "\n" +
  "//查1个\n" +
  "exports.queryOne = function(qry,tran,lock,cb){\n" +
  "    var options={raw:true};\n" +
  "    if(typeof(tran)!='function'){\n" +
  "        if(tran) options.transaction=tran;\n" +
  "        if(typeof(lock)!='function'){\n" +
  "            if(lock) options.lock=lock;\n" +
  "        }\n" +
  "        else{\n" +
  "            cb=lock;\n" +
  "        }\n" +
  "    } else{\n" +
  "        cb=tran;\n" +
  "    }\n" +
  "    \n" +
  "    table.find(qry, options).success(function(res){\n" +
  "        cb(null,res);\n" +
  "    }).error(function (err) {\n" +
#  "        myLogger.error(err);\n" +
  "        cb(err,null);\n" +
  "    })\n" +
  "}\n" +
  "\n" +
  "//查\n" +
  "exports.queryAll = function(qry,tran,lock,cb){\n" +
  "    var options={raw:true};\n" +
  "    if(typeof(tran)!='function'){\n" +
  "        if(tran) options.transaction=tran;\n" +
  "        if(typeof(lock)!='function'){\n" +
  "            if(lock) options.lock=lock;\n" +
  "        }\n" +
  "        else{\n" +
  "            cb=lock;\n" +
  "        }\n" +
  "    } else{\n" +
  "        cb=tran;\n" +
  "    }\n" +
  "    table.findAll(qry, options).success(function(res){\n" +
  "        cb(null,res);\n" +
  "    }).error(function (err) {\n" +
#  "        myLogger.error(err);\n" +
  "        cb(err,null);\n" +
  "    })\n" +
  "}\n"+
  "\n"+
  "//查并计数全部\n" +
  "exports.queryAndCount = function(qry,tran,lock,cb){\n" +
  "    var options={raw:true};\n" +
  "    if(typeof(tran)!='function'){\n" +
  "        if(tran) options.transaction=tran;\n" +
  "        if(typeof(lock)!='function'){\n" +
  "            if(lock) options.lock=lock;\n" +
  "        }\n" +
  "        else{\n" +
  "            cb=lock;\n" +
  "        }\n" +
  "    } else{\n" +
  "        cb=tran;\n" +
  "    }\n" +
  "    table.findAndCountAll(qry, options).success(function(res){\n" +
  "        cb(null,res);\n" +
  "    }).error(function (err) {\n" +
#  "        myLogger.error(err);\n" +
  "        cb(err,null);\n" +
  "    })\n" +
  "}\n";




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
      if(tableName.indexOf("mec_")!= 0)
        result[tableName] = template1.replace(/TABLENAME/g,tableName)
      else if(tableName.indexOf("mec_vi_")== 0)
        result[tableName] = template3.replace(/TABLENAME/g,tableName)
      else result[tableName] =
        template2.replace(/TABLENAME/g,tableName)
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
        targetPath = path.join(daosPath, table_name + "DAO.js")
        fs.writeFileSync targetPath, result[table_name]
        cCount++
        console.log 'create success : ' + targetPath
      console.log 'total daos :' + cCount
      connection.end()