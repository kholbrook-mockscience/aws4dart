// Copyright (c) 2013, the project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed 
// by a Apache license that can be found in the LICENSE file.

/**
 * AWS SDK for Dart
 */
library aws4dart;

import "dart:io";
import "dart:json" as JSON;

import 'package:dice/dice.dart';
import "package:log4dart/log4dart_vm.dart";
import 'package:meta/meta.dart';

import "src/shared/aws4dart_common.dart";
export "src/shared/aws4dart_common.dart" hide HttpMethodName;

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

