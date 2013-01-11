// Copyright (c) 2013 Solvr, Inc. All rights reserved.
//
// This open source software is governed by the license terms
// specified in the LICENSE file

import "dart:crypto";
import "package:unittest/unittest.dart";

import "../lib/src/common/aws_utils.dart";

main() {
  group("utils -", () {
    test("assert crypto utils signing format", () {
      var strToSign = "message";
      var key = "secret";
    
      var sha256 = new SHA256();
      var digest = sha256.update(strToSign.charCodes).digest();
    
      var hmac = new HMAC(new SHA256(), key.charCodes);
      var hmacDigest = hmac.update(digest).digest();
    
      var res = CryptoUtils.bytesToBase64(hmacDigest);
      expect(res, equals("iitKiSAELEC9R6YNPhUfqnHz77xqWtQlOVUW4scT8Rk="));
    });
    
    test("assert UTC string formatting works", () {
      var date = new Date.now();
      print(toUTCString(date));
    });
    
    test("assert query string formatting works", () {
      // TODO figure out if there is a standard DART lib that does this
      expect(queryStringify({"foo": "bar"}), equals("foo=bar"));
      expect(queryStringify({"foo": "bar", "baz": "bob"}, ";", ":"), equals("foo:bar;baz:bob"));
    });
  });
}


