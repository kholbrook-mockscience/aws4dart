// Copyright (c) 2013, the project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed 
// by a Apache license that can be found in the LICENSE file.

part of aws4dart_dynamodb;

class _DynamodbClientImpl implements DynamodbClient {
  // http://docs.aws.amazon.com/AWSJavaScriptSDK/latest/AWS/DynamoDB/Client.html
  // https://github.com/aws/aws-sdk-java/blob/master/src/main/java/com/amazonaws/services/dynamodb/AmazonDynamoDBAsyncClient.java
  _DynamodbClientImpl(this._rpcClient);
  
  final AwsRpcClient _rpcClient;
}