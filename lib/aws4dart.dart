// Copyright (c) 2013 Solvr, Inc. All rights reserved.
//
// This open source software is governed by the license terms
// specified in the LICENSE file

library aws4dart;

import "dart:async";
import "dart:io";
import "dart:json" as JSON;
import "dart:uri";

import "package:dice/dice.dart";
import "package:log4dart/log4dart_vm.dart";
import "package:meta/meta.dart";

part "src/aws.dart";
part "src/s3/s3_client.dart";
part "src/s3/s3_response.dart";

/**
 * AWS client for Dart
 */
Aws aws = new Aws(new _AwsModule());

/**
 * AWS test client for Dart
 */
Aws awsClient(Module module) => new Aws(module);

