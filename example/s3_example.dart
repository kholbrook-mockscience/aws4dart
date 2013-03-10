// Copyright (c) 2013, the project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed 
// by a Apache license that can be found in the LICENSE file.

import "package:aws4dart/aws4dart.dart";

main() {
  var awsClient = getAwsClient();
  awsClient.config.loadFromEnv("AWS_CONFIG");
  
  awsClient.s3.listBuckets().then((List<Bucket> buckets) {
    buckets.forEach((b) => print(b.name));
  });
  
  /*
  awsClient.s3.createBucket('myBucket').then((Bucket bucket) {
    awsClient.s3.putObject(bucket.name, "myKey", "hello").then((resp) {
      print("Successfully uploaded data to myBucket/myKey");
    });
  });
  */
}

