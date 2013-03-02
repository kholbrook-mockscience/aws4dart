// Load the AWS SDK for Node.js
var AWS = require('aws-sdk');

/**
 * Don't hard-code your credentials!
 * Load them from disk or your environment instead.
 */
// AWS.config.update({accessKeyId: 'AKID', secretAccessKey: 'SECRET'});

// Instead, do this:
AWS.config.loadFromPath('/Users/lt/Documents/aws-config.json');

// Set your region for future requests.
//AWS.config.update({region: 'us-east-1'});

var s3 = new AWS.S3();
// list buckets 
s3.client.listBuckets({}, function(err, data) {
  if (err) {
    console.log("Error uploading data: ", err);
  } else {
    console.log("list bukets");
    console.dir(data);
  }
});

// Create a bucket and put something in it.
/*
s3.client.createBucket({Bucket: 'myBucket'}, function() {
  var data = {Bucket: 'myBucket', Key: 'myKey', Body: 'Hello!'};
  s3.client.putObject(data, function(err, data) {
    if (err) {
      console.log("Error uploading data: ", err);
    } else {
      console.log("Successfully uploaded data to myBucket/myKey");
    }
  });
});
*/
