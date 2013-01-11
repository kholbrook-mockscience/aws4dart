// Copyright (c) 2013 Solvr, Inc. All rights reserved.
//
// This open source software is governed by the license terms
// specified in the LICENSE file

library aws4dart_sts;

import "dart:crypto";
import "dart:io";
import "package:xml/xml.dart";

import "src/common/aws_client.dart";
export "src/common/aws_client.dart";

part "src/sts/sts_utils.dart";
part "src/sts/sts_client.dart";
part "src/sts/sts_client_impl.dart";
