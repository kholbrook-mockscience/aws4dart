// Copyright (c) 2013, the project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed 
// by a Apache license that can be found in the LICENSE file.

library aws4dart_test;

import 'dart:async';

import 'package:dice/dice.dart';
import 'package:unittest/unittest.dart';

import '../lib/aws4dart.dart';

part 'services/dynamodb_test.dart';
part 'services/s3_test.dart';

main() {
  var awsClient = getAwsTestClient(new AwsTestModule());
  new S3Test(awsClient);
}

/*
 * Helpers
 */
Matcher isDate = new isInstanceOf<DateTime>();

class AwsTestModule extends Module {
  configure() {
    bind(AwsRpcClient).toInstance(new AwsTestRpcClient());
  }
}

class AwsTestRpcClient implements AwsRpcClient {
  Future<String> getXml(AwsRequest request) => new Future.immediate(mocks[request.runtimeType]);
  
  static Map<Type, String> mocks = new Map<Type, String>();
}

