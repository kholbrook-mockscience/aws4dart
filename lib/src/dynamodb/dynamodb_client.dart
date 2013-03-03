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

part of aws4dart;

/**
 * Amazon DynamoDB client
 */
class DynamodbClient {
  factory DynamodbClient(Injector injector) {
    var rpcClient = injector.getInstance(AwsRpcClient);
    return new DynamodbClient._internal(rpcClient);
  }
  
  DynamodbClient._internal(this._rpcClient);
  
  final AwsRpcClient _rpcClient;
}

