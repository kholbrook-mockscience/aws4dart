part of aws4dart_sts_test;

// Copyright (c) 2013 Solvr, Inc. All rights reserved.
//
// This open source software is governed by the license terms
// specified in the LICENSE file

class StsXmlTest {
  StsXmlTest() {
    test("STS XML Handling", () {
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
      Expect.equals("AKIAIOSFODNN7EXAMPLE", credentials.accessKeyId);
      Expect.equals("2011-07-11 19:55:29.611Z", credentials.expiration.toString());
      Expect.equals("wJalrXUtnFEMI/K7MDENG/bPxRfiCYzEXAMPLEKEY", credentials.secretAccessKey);
    });
  }
}
