[![Build Status](https://drone.io/github.com/ltackmann/aws4dart/status.png)](https://drone.io/github.com/ltackmann/aws4dart/latest)

AWS SDK for Dart
================
SDK for using Amazon web services from Dart.

Quick Guide
-----------

1. Install aws4dart with **pub**
```
pub install aws4dart
```

2. Create a JSON config file containing the AWS credentials
```json
{ "accessKeyId": "akid", "secretAccessKey": "secret", "region": "us-west-2" }
```

3. Run it
```dart
    import "package:aws4dart/aws4dart.dart";
    main() {
      var awsClient = getAwsClient();
      awsClient.config.loadFromPath("aws-config.json");
  
      awsClient.s3.createBucket('myBucket').then((Bucket bucket) {
        awsClient.s3.putObject(bucket.name, "myKey", "hello").then((resp) {
          print("Successfully uploaded data" to myBucket/myKey");
        });
      });
    }
```

Supported Services
------------------
<table>
  <thead>
    <th>Service Name</th>
    <th>API Version</th>
  </thead>
  <tbody>
    <!--tr>
      <td>Auto Scaling</td>
      <td>2011-01-01</td>
    </tr>
    <tr>
      <td>AWS CloudFormation</td>
      <td>2010-05-15</td>
    </tr>
    <tr>
      <td>Amazon CloudFront</td>
      <td>2012-05-05</td>
    </tr>
    <tr>
      <td>Amazon CloudWatch</td>
      <td>2010-08-01</td>
    </tr>
    <tr>
      <td>Amazon CloudSearch</td>
      <td>2011-02-01</td>
    </tr>
    <tr>
      <td>AWS Data Pipeline</td>
      <td>2012-10-29</td>
    </tr>
    <tr>
      <td>AWS Direct Connect</td>
      <td>2012-10-25</td>
    </tr-->
    <tr>
      <td>Amazon DynamoDB</td>
      <td>2011-12-05</td>
    </tr>
    <!--tr>
      <td>Amazon Elastic Compute Cloud</td>
      <td>2012-12-01</td>
    </tr>
    <tr>
      <td>Amazon ElastiCache</td>
      <td>2012-11-15</td>
    </tr>
    <tr>
      <td>Amazon Glacier</td>
      <td>2012-06-01</td>
    </tr>
    <tr>
      <td>Amazon Route 53</td>
      <td>2012-12-12</td>
    </tr>
    <tr>
      <td>AWS Elastic Beanstalk</td>
      <td>2010-12-01</td>
    </tr>
    <tr>
      <td>Elastic Load Balancing</td>
      <td>2012-06-01</td>
    </tr>
    <tr>
      <td>Amazon Elastic MapReduce</td>
      <td>2009-03-31</td>
    </tr>
    <tr>
      <td>Amazon Elastic Transcoder</td>
      <td>2012-09-25</td>
    </tr>
    <tr>
      <td>AWS Identity and Access Management</td>
      <td>2010-05-08</td>
    </tr>
    <tr>
      <td>AWS Import/Export</td>
      <td>2010-06-01</td>
    </tr>
    <tr>
      <td>AWS OpsWorks</td>
      <td>2013-02-18</td>
    </tr>
    <tr>
      <td>Amazon Relational Database Service (Beta)</td>
      <td>2012-07-31</td>
    </tr>
    <tr>
      <td>Amazon Redshift</td>
      <td>2012-12-01</td>
    </tr-->
    <tr>
      <td>Amazon S3</td>
      <td>2006-03-01</td>
    </tr>
    <!--tr>
      <td>Amazon SimpleDB</td>
      <td>2009-04-15</td>
    </tr>
    <tr>
      <td>Amazon Simple Workflow Service</td>
      <td>2012-01-25</td>
    </tr>
    <tr>
      TODO next
      <td>Amazon Simple Email Service</td>
      <td>2010-12-01</td>
    </tr>
    <tr>
      <td>Amazon Simple Notification Service</td>
      <td>2010-03-31</td>
    </tr>
    <tr>
      TODO next
      <td>Amazon Simple Queue Service</td>
      <td>2012-11-05</td>
    </tr>
    <tr>
      <td>AWS Storage Gateway</td>
      <td>2012-06-30</td>
    </tr>
    <tr>
       TODO likely a part of DynamoDB
      <td>AWS Security Token Service</td>
      <td>2011-06-15</td>
    </tr-->
  </tbody>
</table>

