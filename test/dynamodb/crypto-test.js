var crypto = require('crypto');

var strToSign = "message";
var key = "secret";

var digest =  crypto.createHash('sha256').update(strToSign, 'utf8').digest('binary');
var res = crypto.createHmac('sha256', key).update(new Buffer(digest, 'binary')).digest("base64");

console.log('res: ' + res);

