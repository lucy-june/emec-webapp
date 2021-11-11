var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res) {
  console.log("\n\n###############################");
  console.log(new Date());
  console.log(require('url').parse(req.url,true).query);
  console.log("###############################\n\n");
});

router.post('/', function(req, res) {
  console.log("\n\n*******************************");
  console.log(new Date());
  console.log(req.body);
  console.log("*******************************\n\n");
});


module.exports = router;
