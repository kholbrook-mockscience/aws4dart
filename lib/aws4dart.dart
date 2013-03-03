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
//import "package:http/http.dart" as http;
import "package:log4dart/log4dart_vm.dart";
import "package:meta/meta.dart";
import "package:xml/xml.dart";

import "src/aws_utils.dart";

part "src/aws.dart";
part "src/s3/s3_client.dart";
part "src/s3/s3_response.dart";

/**
 * AWS client 
 */
Aws awsClient = new Aws(new _AwsModule());

/**
 * AWS test client 
 */
Aws awsTestClient(Module module) => new Aws(module);

