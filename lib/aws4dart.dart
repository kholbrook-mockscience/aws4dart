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

/**
 * AWS SDK for Dart
 */
library aws4dart;

import "dart:io";
import "dart:json" as JSON;

import 'package:dice/dice.dart';
import "package:log4dart/log4dart_vm.dart";
import 'package:meta/meta.dart';

// clients
import "src/aws4dart_dynamodb.dart";
export "src/aws4dart_dynamodb.dart";
import "src/aws4dart_s3.dart";
export "src/aws4dart_s3.dart";

part "src/aws.dart";

/**
 * Get an AWS client 
 */
AwsClient getAwsClient() => new AwsClient(new _AwsModule());

/**
 * Get an AWS client, suitable for unit and integration testing.
 */
AwsClient getAwsTestClient(Module module) => new AwsClient(module);

