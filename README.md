[![Build Status](https://drone.io/github.com/ltackmann/aws4dart/status.png)](https://drone.io/github.com/ltackmann/aws4dart/latest)

AWS SDK for Dart
================

Port of https://github.com/aws/aws-sdk-js http://aws.amazon.com/sdkfornodejs/

Get Started Fast
================

Install
-------
```
pub install aws4dart
```

Configure
---------
Create a JSON config file containing the AWS credentials
```
{ "accessKeyId": "akid", "secretAccessKey": "secret", "region": "us-west-2" }
```

Run
---
```
var AWS = require('aws-sdk');
var s3 = new AWS.S3();

AWS.config.loadFromPath('./aws-config.json');

s3.createBucket({Bucket: 'myBucket'}, function() {
  var params = {Bucket: 'myBucket', Key: 'myKey', Body: 'Hello!'};
  s3.putObject(params, function(err, data) {
    if (err)
      console.log(err)
    else
      console.log("Successfully uploaded data to myBucket/myKey");
  });
});
```

Supported Services
------------------
<table>
  <thead>
    <th>Service Name</th>
    <th>API Version</th>
    <th>Class Name</th>
  </thead>
  <tbody>
    <!--tr>
      <td>Auto Scaling</td>
      <td>2011-01-01</td>
      <td>AWS.AutoScaling</td>
    </tr>
    <tr>
      <td>AWS CloudFormation</td>
      <td>2010-05-15</td>
      <td>AWS.CloudFormation</td>
    </tr>
    <tr>
      <td>Amazon CloudFront</td>
      <td>2012-05-05</td>
      <td>AWS.CloudFront</td>
    </tr>
    <tr>
      <td>Amazon CloudWatch</td>
      <td>2010-08-01</td>
      <td>AWS.CloudWatch</td>
    </tr>
    <tr>
      <td>Amazon CloudSearch</td>
      <td>2011-02-01</td>
      <td>AWS.CloudSearch</td>
    </tr>
    <tr>
      <td>AWS Data Pipeline</td>
      <td>2012-10-29</td>
      <td>AWS.DataPipeline</td>
    </tr>
    <tr>
      <td>AWS Direct Connect</td>
      <td>2012-10-25</td>
      <td>AWS.DirectConnect</td>
    </tr-->
    <tr>
      <td>Amazon DynamoDB</td>
      <td>2011-12-05</td>
      <td>AWS.DynamoDB</td>
    </tr>
    <!--tr>
      <td>Amazon Elastic Compute Cloud</td>
      <td>2012-12-01</td>
      <td>AWS.EC2</td>
    </tr>
    <tr>
      <td>Amazon ElastiCache</td>
      <td>2012-11-15</td>
      <td>AWS.ElastiCache</td>
    </tr>
    <tr>
      <td>Amazon Glacier</td>
      <td>2012-06-01</td>
      <td>AWS.Glacier</td>
    </tr>
    <tr>
      <td>Amazon Route 53</td>
      <td>2012-12-12</td>
      <td>AWS.Route53</td>
    </tr>
    <tr>
      <td>AWS Elastic Beanstalk</td>
      <td>2010-12-01</td>
      <td>AWS.ElasticBeanstalk</td>
    </tr>
    <tr>
      <td>Elastic Load Balancing</td>
      <td>2012-06-01</td>
      <td>AWS.ELB</td>
    </tr>
    <tr>
      <td>Amazon Elastic MapReduce</td>
      <td>2009-03-31</td>
      <td>AWS.EMR</td>
    </tr>
    <tr>
      <td>Amazon Elastic Transcoder</td>
      <td>2012-09-25</td>
      <td>AWS.ElasticTranscoder</td>
    </tr>
    <tr>
      <td>AWS Identity and Access Management</td>
      <td>2010-05-08</td>
      <td>AWS.IAM</td>
    </tr>
    <tr>
      <td>AWS Import/Export</td>
      <td>2010-06-01</td>
      <td>AWS.ImportExport</td>
    </tr>
    <tr>
      <td>AWS OpsWorks</td>
      <td>2013-02-18</td>
      <td>AWS.OpsWorks</td>
    </tr>
    <tr>
      <td>Amazon Relational Database Service (Beta)</td>
      <td>2012-07-31</td>
      <td>AWS.RDS</td>
    </tr>
    <tr>
      <td>Amazon Redshift</td>
      <td>2012-12-01</td>
      <td>AWS.Redshift</td>
    </tr-->
    <tr>
      <td>Amazon Simple Storage Service</td>
      <td>2006-03-01</td>
      <td>AWS.S3</td>
    </tr>
    <!--tr>
      <td>Amazon SimpleDB</td>
      <td>2009-04-15</td>
      <td>AWS.SimpleDB</td>
    </tr>
    <tr>
      <td>Amazon Simple Workflow Service</td>
      <td>2012-01-25</td>
      <td>AWS.SimpleWorkflow</td>
    </tr>
    <tr>
      <td>Amazon Simple Email Service</td>
      <td>2010-12-01</td>
      <td>AWS.SES</td>
    </tr>
    <tr>
      <td>Amazon Simple Notification Service</td>
      <td>2010-03-31</td>
      <td>AWS.SNS</td>
    </tr>
    <tr>
      <td>Amazon Simple Queue Service</td>
      <td>2012-11-05</td>
      <td>AWS.SQS</td>
    </tr>
    <tr>
      <td>AWS Storage Gateway</td>
      <td>2012-06-30</td>
      <td>AWS.StorageGateway</td>
    </tr>
    <tr>
      <td>AWS Security Token Service</td>
      <td>2011-06-15</td>
      <td>AWS.STS</td>
    </tr-->
  </tbody>
</table>


License
-------
BSD License (Same as Dart itself). See LICENSE file.  
