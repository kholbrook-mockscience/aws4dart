part of aws4dart_dynamodb;

// Copyright (c) 2012 Solvr, Inc. All rights reserved.
//
// This open source software is governed by the license terms
// specified in the LICENSE file

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
     var authorization = "AWS3 AWSAccessKeyId=${credentials.accessKeyId},Algorithm=HmacSHA256,SignedHeaders=${Strings.join(headersToSign,':')},Signature=$signature";

     headers.add(new Header(HeaderType.AWS_AUTHORIZATION, authorization));
     return headers;
   }

   List<Header> _getHeadersToSign(List<Header> headers) => headers.filter((Header header) => header.type.isAwsHeader);

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
     List<HeaderType> sorted = new List.from(headerMap.getKeys());
     sorted.sort((HeaderType a, HeaderType b) => (a.name).compareTo(b.name));

     // convert value into format header-name:header-value\n
     List<String> result = [];
     sorted.forEach((HeaderType type) {
       result.add("${type.name}:${headerMap[type]}\n");
     });

     return Strings.join(result, "");
   }

   String _getStringToSign(String canonicalHeaders, Map body) {
     var toSign = {
                   "method" : "POST",
                   "uri" : "/",
                   "query" : "",
                   "headers" : canonicalHeaders,
                   "body" : JSON.stringify(body)
                  };
     return Strings.join(toSign.getValues(), "\n");
   }

   String _generateSignature(String strToSign, String key) {
     var sha256 = new SHA256();
     var digest = sha256.update(strToSign.charCodes()).digest();

     var hmac = new HMAC(new SHA256(), key.charCodes());
     var hmacDigest = hmac.update(digest).digest();

     return CryptoUtils.bytesToBase64(hmacDigest);
   }
}

