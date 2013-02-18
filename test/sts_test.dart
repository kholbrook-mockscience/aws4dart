// Copyright (c) 2013 Solvr, Inc. All rights reserved.
//
// This open source software is governed by the license terms
// specified in the LICENSE file

import "package:unittest/unittest.dart";
import "../lib/sts.dart";

main() {
  group("sts -", () {
    test("response parsing", () {
      var testXml = '''
          <GetSessionTokenResponse xmlns="https://sts.amazonaws.com/doc/2011-06-15/">
            <GetSessionTokenResult>
              <Credentials>
                <SessionToken>
                 AQoEXAMPLEH4aoAH0gNCAPyJxz4BlCFFxWNE1OPTgk5TthT+FvwqnKwRcOIfrRh3c/L
                 To6UDdyJwOOvEVPvLXCrrrUtdnniCEXAMPLE/IvU1dYUg2RVAJBanLiHb4IgRmpRV3z
                 rkuWJOgQs8IZZaIv2BXIa2R4OlgkBN9bkUDNCJiBeb/AXlzBBko7b15fjrBs2+cTQtp
                 Z3CYWFXG8C5zqx37wnOE49mRl/+OtkIKGO7fAE
                </SessionToken>
                <SecretAccessKey>
                wJalrXUtnFEMI/K7MDENG/bPxRfiCYzEXAMPLEKEY
                </SecretAccessKey>
                <Expiration>2011-07-11T19:55:29.611Z</Expiration>
                <AccessKeyId>AKIAIOSFODNN7EXAMPLE</AccessKeyId>
              </Credentials>
            </GetSessionTokenResult>
            <ResponseMetadata>
              <RequestId>58c5dbae-abef-11e0-8cfe-09039844ac7d</RequestId>
            </ResponseMetadata>
          </GetSessionTokenResponse>
        ''';
      var credentials = new StsCredential.fromXml(testXml);
      expect(credentials.accessKeyId, equals("AKIAIOSFODNN7EXAMPLE"));
      expect(credentials.expiration.toString(), equals("2011-07-11 19:55:29.611Z"));
      expect(credentials.secretAccessKey, equals("wJalrXUtnFEMI/K7MDENG/bPxRfiCYzEXAMPLEKEY"));
    });
    
    test("request handling", () {
      var config = new AwsConfig.fromJsonFile("/Users/lt/Projects/dart/aws4dart/test/sandbox/aws-config.json");
      var client = new StsClient(config);
      client.getSessionToken().then((StsCredential credential) {
        expect(credential.accessKeyId, isNotNull);
        print("expires at ${credential.expiration}");
      });
    });
  });
}
