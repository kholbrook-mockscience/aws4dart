part of aws4dart_sts_test;

// Copyright (c) 2013 Solvr, Inc. All rights reserved.
//
// This open source software is governed by the license terms
// specified in the LICENSE file

class StsRequestTest {
  StsRequestTest() {
    test("STS Requests", () {
      var config = new AwsConfig.fromJsonFile("/Users/lt/Projects/dart/aws4dart/test/sandbox/aws-config.json");
      var client = new StsClient(config);
      client.getSessionToken().then((StsCredential credential) {
        Expect.isNotNull(credential.accessKeyId);
        print("expires at ${credential.expiration}");
      });
    });
  }
}
