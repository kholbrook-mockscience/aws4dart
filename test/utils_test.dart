// Copyright (c) 2013 Solvr, Inc. All rights reserved.
//
// This open source software is governed by the license terms
// specified in the LICENSE file

import "dart:crypto";
import "package:unittest/unittest.dart";

import "../lib/src/aws_utils.dart";

main() {
  group("aws utils -", () {
    test("assert crypto utils signing format", () {
      var strToSign = "message";
      var key = "secret";
    
      var sha256 = new SHA256();
      var digest = (sha256..add(strToSign.charCodes)).close();
      
      var hmac = new HMAC(new SHA256(), key.charCodes);
      var hmacDigest = (hmac..add(digest)).close();
    
      var res = CryptoUtils.bytesToBase64(hmacDigest);
      expect(res, equals("iitKiSAELEC9R6YNPhUfqnHz77xqWtQlOVUW4scT8Rk="));
    });
    
    test("UTC string formatting", () {
      var date = new Date.fromMillisecondsSinceEpoch(1223380935000, isUtc:true);
      
      expect(date.toUtc, isNot(equals("Wen, 7 Oct 2008 12:02:15 GMT")), reason:"check if internal UTC format is compatible with amazon");
      expect(toUTCString(date), equals("Wen, 7 Oct 2008 12:02:15 GMT"));
    });
    
    test("query string formatting", () {
      expect(queryStringify({"foo": "bar"}), equals("foo=bar"));
      expect(queryStringify({"foo": "bar", "baz": "bob"}, separator:";", equal:":"), equals("foo:bar;baz:bob"));
    });
  });
}


