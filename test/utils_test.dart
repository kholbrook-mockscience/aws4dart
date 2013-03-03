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
      var date = new DateTime.fromMillisecondsSinceEpoch(1223380935000, isUtc:true);
      
      expect(date.toUtc, isNot(equals("Wen, 7 Oct 2008 12:02:15 GMT")), reason:"check if internal UTC format is compatible with amazon");
      expect(toUTCString(date), equals("Wen, 7 Oct 2008 12:02:15 GMT"));
    });
    
    test("query string formatting", () {
      expect(queryStringify({"foo": "bar"}), equals("foo=bar"));
      expect(queryStringify({"foo": "bar", "baz": "bob"}, separator:";", equal:":"), equals("foo:bar;baz:bob"));
    });
  });
}


