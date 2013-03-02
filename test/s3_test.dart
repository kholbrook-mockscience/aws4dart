// Copyright (c) 2013 Solvr, Inc. All rights reserved.
//
// This open source software is governed by the license terms
// specified in the LICENSE file

import "package:unittest/unittest.dart";
import "../lib/aws4dart.dart";

main() {
  // https://github.com/aws/aws-sdk-js/blob/master/test/services/s3.spec.coffee
  group("s3 client -", () {
    aws.config.update(r"{'accessKeyId': 'AKID', 'secretAccessKey': 'SECRET'}");
    
    var s3 = aws.s3;
    // TODO IOC https://groups.google.com/forum/?fromgroups=#!topic/google-guice/DUX3xEwGtGs
    
    test("listBuckets", () {
      // http://docs.aws.amazon.com/AWSJavaScriptSDK/latest/AWS/S3/Client.html#listBuckets-property
      var resp = 
          """
          <?xml version="1.0" encoding="UTF-8"?>
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
      
        s3.listBuckets().then(expectAsync1((BucketsResult res) {
          expect(res.owner.id, equals("bcaf1ffd86f461ca5fb16fd081034f"));
          expect(res.owner.displayName, equals("webfile"));
          
          expect(res.buckets.length, equals(2));
          expect(res.buckets[0].name, equals("quotes"));
          expect(res.buckets[0].creationDate.toString(), equals("2006-02-03T16:45:09.000Z"));
          expect(res.buckets[1].name, equals("samples"));
          expect(res.buckets[1].creationDate.toString(), equals("2006-02-03T16:41:58.000Z"));
        }));
    });
  });
}