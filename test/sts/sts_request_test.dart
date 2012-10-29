part of aws4dart:sts:test;

// Copyright (c) 2012 Solvr, Inc. All rights reserved.
//
// This open source software is governed by the license terms
// specified in the LICENSE file

class StsRequestTest {
  StsRequestTest() {
    test("STS Requests", () {
      var config = new AwsConfig.fromJsonFile("/Users/Lars/projects/qalqo/common/aws/test/aws-config.json");
      var client = new StsClient(config);
      client.getSessionToken().then((StsCredential credential) {
        Expect.isNotNull(credential.accessKeyId);
        print("expires at ${credential.expiration}");
      });
    });
  }
}
