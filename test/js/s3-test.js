// Load the AWS SDK for Node.js
var AWS = require('aws-sdk');

/**
 * Don't hard-code your credentials!
 * Load them from disk or your environment instead.
 */
// AWS.config.update({accessKeyId: 'AKID', secretAccessKey: 'SECRET'});

// Instead, do this:
AWS.config.loadFromPath('./credentials.json');

// Set your region for future requests.
AWS.config.update({region: 'us-east-1'});

// Create a bucket and put something in it.
var s3 = new AWS.S3();
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