// Copyright (c) 2012 Solvr, Inc. All rights reserved.
//
// This open source software is governed by the license terms
// specified in the LICENSE file

import "../../lib/src/utils/lib.dart";

main() {
  var date = new Date.now();
  print(toUTCString(date));
}

testQueryStringify() {
  var query1 = queryStringify({"foo": "bar"});
  Expect.equals("foo=bar", query1);

  var query2 = queryStringify({"foo": "bar", "baz": "bob"}, ";", ":");
  Expect.equals("foo:bar;baz:bob", query2);
}
