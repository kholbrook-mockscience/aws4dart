// Copyright (c) 2013 Solvr, Inc. All rights reserved.
//
// This open source software is governed by the license terms
// specified in the LICENSE file

part of aws4dart_dynamo;

/**
 * Request signer for Amazon DynamoDB
 *
 * Inspired by https://raw.github.com/Wantworthy/dynode/master/lib/dynode/request-signer.js
 */
class _Signer {
   /**
    * Sign request body and headers as specified in the AWS documentation
    *
    * http://docs.amazonwebservices.com/amazondynamodb/latest/developerguide/HMACAuth.html
    */
   List<Header> sign(List<Header> headers, Map body, AwsCredential credentials) {
     var headersToSign = _getHeadersToSign(headers);
     var canonicalHeaders = _canonicalizeHeaders(headersToSign);
     var strToSign = _getStringToSign(canonicalHeaders, body);
     var signature = _generateSignature(strToSign, credentials.secretAccessKey);
     var authorization = "AWS3 AWSAccessKeyId=${credentials.accessKeyId},Algorithm=HmacSHA256,SignedHeaders=${headersToSign.join(':')},Signature=$signature";

     headers.add(new Header(HeaderType.AWS_AUTHORIZATION, authorization));
     return headers;
   }

   List<Header> _getHeadersToSign(List<Header> headers) => headers.where((Header header) => header.type.isAwsHeader);

   String _canonicalizeHeaders(List<Header> headers) {
     var headerMap = new Map<HeaderType, String>();
     headers.forEach((Header header) {
       var type = header.type;
       // a) comma separate the values of duplicated headers as pr RFC2616 sec 4.2
       if(headerMap.containsKey(type)) {
         var existingValue = headerMap[type];
         headerMap[type] = "$existingValue,${header.value}";
       } else {
         headerMap[type] = header.value;
       }
     });
     // sort headers by type name
     var sorted = new List.from(headerMap.keys);
     sorted.sort((HeaderType a, HeaderType b) => (a.name).compareTo(b.name));

     // convert value into format header-name:header-value\n
     var result = <String>[];
     sorted.forEach((HeaderType type) {
       result.add("${type.name}:${headerMap[type]}\n");
     });

     return result.join("");
   }

   String _getStringToSign(String canonicalHeaders, Map body) {
     var toSign = {
                   "method" : "POST",
                   "uri" : "/",
                   "query" : "",
                   "headers" : canonicalHeaders,
                   "body" : JSON.stringify(body)
                  };
     return toSign.values.join("\n");
   }

   String _generateSignature(String strToSign, String key) {
     var sha256 = new SHA256();
     var digest = (sha256..add(strToSign.charCodes)).close();

     var hmac = new HMAC(new SHA256(), key.charCodes);
     var hmacDigest = (hmac..add(digest)).close();

     return CryptoUtils.bytesToBase64(hmacDigest);
   }
}

