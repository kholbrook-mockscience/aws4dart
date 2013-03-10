// Copyright (c) 2013, the project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed 
// by a Apache license that can be found in the LICENSE file.

/**
 * S3 client library
 */
library aws4dart_s3;

import "dart:async";

import "package:dice/dice.dart";
import "package:http/http.dart";
import "package:xml/xml.dart";

import "shared/aws4dart_common.dart"; 
import "shared/aws4dart_utils.dart";

/*
import "dart:io";
import "dart:json" as JSON;
import "dart:uri";
import "package:log4dart/log4dart_vm.dart";
import "package:meta/meta.dart";
import "package:xml/xml.dart";
import "src/aws_utils.dart";
*/

part "s3/s3_client.dart";
//part "s3/s3_http_client.dart";
part "s3/s3_model.dart";
part "s3/s3_request.dart";
part "s3/s3_response.dart";

