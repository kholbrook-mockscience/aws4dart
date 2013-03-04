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

/**
 * Common public functionality used accross clients (exported to end users).
 */
library aws4dart_common;

import "dart:async";
import "dart:uri";

//import 'package:http/http.dart';

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
