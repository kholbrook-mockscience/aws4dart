// Copyright (c) 2013 Solvr, Inc. All rights reserved.
//
// This open source software is governed by the license terms
// specified in the LICENSE file

import "package:unittest/unittest.dart";
import "../lib/aws4dart.dart";

main() {
  group("s3 client -", () {
    awsClient.config.loadFromPath('/Users/lt/Documents/aws-config.json');
  });
  // https://github.com/aws/aws-sdk-js/blob/master/test/services/dynamodb.spec.coffee
  // https://github.com/ca98am79/connect-dynamodb
}



