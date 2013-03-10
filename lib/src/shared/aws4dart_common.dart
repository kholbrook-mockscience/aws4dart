// Copyright (c) 2013, the project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed 
// by a Apache license that can be found in the LICENSE file.

/**
 * Common public functionality used accross clients (exported to end users).
 */
library aws4dart_common;

import "dart:async";
import "dart:uri";

import 'package:http/http.dart';

abstract class AwsHttpClient {
  Uri endpoint;
}

/**
 * Client for making HTTP requests against Amazon's web services
 */
class AwsRpcClient {
  Future<String> getXml(AwsRequest request) {
    var completer = new Completer<String>();
    String url = "TODO";
    get(url).then((Response response) {
      if(response.statusCode != 200) {
        completer.completeError(new AwsError("STS faild with", response.statusCode));
      } else {
        completer.complete(response.body);
      }
    });
    
    return completer.future;
  }
}

/**
 * TODO describe
 */
class AwsError implements Error {
  AwsError(this.errorMessage, this.errorCode);
  
  final String errorMessage;
  final int errorCode;
}

abstract class AwsRequest {
  
}

class AwsCredentials {
  
}

class HttpMethodName {
  static const GET = const HttpMethodName("GET");
  
  const HttpMethodName(this.httpMethod);
  
  final String httpMethod;
}
