// Copyright (c) 2013, the project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed 
// by a Apache license that can be found in the LICENSE file.

part of aws4dart_dynamodb;

class _DynamodbClientImpl implements DynamodbClient {
  _DynamodbClientImpl(this._rpcClient);
  
  final AwsRpcClient _rpcClient;
}