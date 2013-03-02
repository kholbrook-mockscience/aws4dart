// Copyright (c) 2013 Solvr, Inc. All rights reserved.
//
// This open source software is governed by the license terms
// specified in the LICENSE file

import "package:unittest/unittest.dart";
import "../lib/aws4dart.dart";

main() {
  // https://github.com/aws/aws-sdk-js/blob/master/test/services/s3.spec.coffee
  group("", () {
    var s3client = new S3Client();
    // TODO authenticate client
    
    test("listBuckets", () {
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
      
        s3client.listBuckets();
    });
  });
}