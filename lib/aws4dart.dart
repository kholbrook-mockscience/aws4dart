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
// dynamodb
part "src/dynamodb/dynamodb_client.dart";
part "src/dynamodb/dynamodb_response.dart";
// s3
part "src/s3/s3_client.dart";
part "src/s3/s3_response.dart";

/**
 * AWS client 
 */
AwsClient awsClient = new AwsClient(new _AwsModule());

/**
 * AWS test client 
 */
AwsClient awsTestClient(Module module) => new AwsClient(module);

