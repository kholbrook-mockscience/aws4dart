// Copyright (c) 2012 Solvr, Inc. All rights reserved.
//
// This open source software is governed by the license terms
// specified in the LICENSE file

import "dart:crypto";

// TODO make into unit test
main() {
  var strToSign = "message";
  var key = "secret";

  var sha256 = new SHA256();
  var digest = sha256.update(strToSign.charCodes).digest();

  var hmac = new HMAC(new SHA256(), key.charCodes);
  var hmacDigest = hmac.update(digest).digest();

  var res = CryptoUtils.bytesToBase64(hmacDigest);
  Expect.equals("iitKiSAELEC9R6YNPhUfqnHz77xqWtQlOVUW4scT8Rk=", res);
}
