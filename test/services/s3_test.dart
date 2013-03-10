// Copyright (c) 2013, the project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed 
// by a Apache license that can be found in the LICENSE file.

part of aws4dart_test;

class S3Test {
  S3Test(AwsClient awsClient) {
    // https://github.com/aws/aws-sdk-js/blob/master/test/services/s3.spec.coffee
    group("s3 client -", () {
      var s3 = awsClient.s3;
      
      test("configure interface", () {
        awsClient.config.update(r'{"accessKeyId": "AKID", "secretAccessKey": "SECRET"}');
      });
      
      test("listBuckets", () {
        // http://docs.aws.amazon.com/AWSJavaScriptSDK/latest/AWS/S3/Client.html#listBuckets-property
        AwsTestRpcClient.mocks[ListBucketsRequest] = 
          """
          <ListAllMyBucketsResult xmlns="http://doc.s3.amazonaws.com/2006-03-01">
            <Owner>
              <ID>bcaf1ffd86f461ca5fb16fd081034f</ID>
              <DisplayName>webfile</DisplayName>
            </Owner>
            <Buckets>
              <Bucket>
                <Name>quotes</Name>
                <CreationDate>2006-02-03T16:45:09.000Z</CreationDate>
              </Bucket>
              <Bucket>
                <Name>samples</Name>
                <CreationDate>2006-02-03T16:41:58.000Z</CreationDate>
              </Bucket>
            </Buckets>
          </ListAllMyBucketsResult>
          """;
        
        s3.listBuckets().then(expectAsync1((List<Bucket> buckets) {
          expect(buckets.length, equals(2));
          expect(buckets[0].name, equals("quotes"));
          expect(buckets[0].creationDate, isDate);
          expect(buckets[1].name, equals("samples"));
          expect(buckets[1].creationDate, isDate);
        }));
      });
    });
  }
}

