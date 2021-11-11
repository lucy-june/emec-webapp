var express         = require('express');
var path            = require('path');
var favicon         = require('static-favicon');
var cookieParser    = require('cookie-parser');
var bodyParser      = require('body-parser');
var logger          = require('morgan');
var accessLogger    = require('./logging/accessLogger');
var uncaught        = require('./exception/uncaught');
var session         = require('express-session');

var routes          = require('./routes/web/login');
var account        = require('./routes/web/account');
var items           = require('./routes/web/items');
var orders          = require('./routes/web/orders');
var other           = require('./routes/web/other');
var skc             = require('./routes/web/skc');
var formis          = require('./routes/web/formis');
var admin            = require('./routes/web/super');
var verify          =require('./routes/web/verify');

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
app.use('/', routes);
app.use('/account', account);
app.use('/items', items);
app.use('/orders', orders);
app.use('/other', other);
app.use('/skc', skc);
app.use('/formis', formis);
app.use('/super', admin);
app.use('/verify', verify);

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
