// Copyright (c) 2012 Solvr, Inc. All rights reserved.
//
// This open source software is governed by the license terms
// specified in the LICENSE file

library aws4dart:sts:test;

import "package:unittest/unittest.dart";
import "../../utils/Lib.dart";
import "../lib.dart";

part "sts_xml_test.dart";
part "sts_request_test.dart";

main() {
  new StsXmlTest();
  new StsRequestTest();
}

