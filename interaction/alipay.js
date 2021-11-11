/**
 * Created by lucywu on 12/19/14.
 */
var node_env = process.env.NODE_ENV ? process.env.NODE_ENV : 'dev';
var alipayConfig = require('../config/alipayConfig.json')[node_env];
var httpsRequest    = require('../util/httpsRequest');