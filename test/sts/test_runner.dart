// Copyright (c) 2013 Solvr, Inc. All rights reserved.
//
// This open source software is governed by the license terms
// specified in the LICENSE file

library aws4dart_sts_test;

import "package:unittest/unittest.dart";
import "../../lib/src/utils/lib.dart";
import "../../lib/sts.dart";

part "sts_xml_test.dart";
part "sts_request_test.dart";

main() {
  new StsXmlTest();
  new StsRequestTest();
}

