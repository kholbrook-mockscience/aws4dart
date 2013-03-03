/*
 * Copyright 2013 Solvr, Inc. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"). You
 * may not use this file except in compliance with the License. A copy of
 * the License is located at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * or in the "license" file accompanying this file. This file is
 * distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
 * ANY KIND, either express or implied. See the License for the specific
 * language governing permissions and limitations under the License.
 */

library aws4dart_test;

import "dart:async";

import 'package:dice/dice.dart';
import 'package:meta/meta.dart';
import 'package:unittest/unittest.dart';

import '../lib/aws4dart.dart';

part "services/dynamodb_test.dart";
part "services/s3_test.dart";

main() {
  var awsClient = getAwsTestClient(new AwsTestModule());
  new S3Test(awsClient);
}

/*
 * Helpers
 */
Matcher isDate = new isInstanceOf<DateTime>();

class AwsTestModule extends Module {
  @override 
  configure() {
    bind(AwsRpcClient).toInstance(new AwsTestRpcClient());
  }
}

class AwsTestRpcClient implements AwsRpcClient {
  Future<String> getXml(String path) => new Future.immediate(mocks[path]);
  
  static Map<String, String> mocks = {};
}

