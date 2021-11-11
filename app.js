var express         = require('express');
var path            = require('path');
var favicon         = require('static-favicon');
var cookieParser    = require('cookie-parser');
var bodyParser      = require('body-parser');
var logger          = require('morgan');
var accessLogger    = require('./logging/accessLogger');
var uncaught        = require('./exception/uncaught');
var session         = require('express-session');

var app_account     = require('./routes/app/account');
var app_item        = require('./routes/app/item');
var app_category    = require('./routes/app/category');
var app_analysis    = require('./routes/app/analysis');
var app_region      = require('./routes/app/region');
var app_cart        = require('./routes/app/cart');
var app_order       = require('./routes/app/order');
var app_site        = require('./routes/app/site');
var app_umspay      = require('./routes/app/umspay');
var app_logistics   = require('./routes/app/logistics');
var app_behavior    = require('./routes/app/behavior');
var app_home        = require('./routes/app/home');
var app_edithome        = require('./routes/app/editHome');
var app_vip      = require('./routes/app/vip');


var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

//use some properties
app.use(favicon());
app.use(logger(accessLogger));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded());
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use(session({secret: 'lucywuking',resave:{},saveUninitialized:{}}));//secret是必须的https://github.com/expressjs/session

//add routes
app.use('/app/account', app_account );
app.use('/app/item', app_item );
app.use('/app/category', app_category);
app.use('/app/analysis', app_analysis);
app.use('/app/region', app_region);
app.use('/app/cart', app_cart);
app.use('/app/order', app_order);
app.use('/app/site', app_site);
app.use('/app/umspay', app_umspay);
app.use('/app/home', app_home);
app.use('/app/edithome', app_edithome);

/// catch 404 and forward to error handler
app.use(function(req, res, next) {
    var err = new Error('Not Found');
    err.status = 404;
    next(err);
});

// development error handler
// will print stacktrace
if (app.get('env') === 'development') {
    app.use(function(err, req, res, next) {
        res.status(err.status || 500);
        res.render('error', {
            message: err.message,
            error: err
        });
    });
}

// production error handler
// no stacktraces leaked to user
app.use(function(err, req, res, next) {
    res.status(err.status || 500);
    res.render('error', {
        message: err.message,
        error: {}
    });
});

module.exports = app;
