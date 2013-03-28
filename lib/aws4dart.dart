// Copyright (c) 2013, the project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed 
// by a Apache license that can be found in the LICENSE file.

/**
 * AWS SDK for Dart
 */
library aws4dart;

import "package:dice/dice.dart";

/* external api */
import "src/aws4dart_dynamodb.dart";
export "src/dynamodb/aws4dart_dynamodb.dart";
import "src/aws4dart_s3.dart";
export "src/s3/aws4dart_s3.dart";
import "src/aws4dart_api.dart";
export "src/aws4dart_api.dart";

/* implementation */

/** Get an AWS client */
AwsClient getAwsClient() => new _AwsClient(new _AwsModule());

/** Get an AWS mock client, suitable for unit testing */
AwsClient getAwsTestClient(Module module) => new _AwsClient(module);

/** Amason Web Service client */
abstract class AwsClient {  
  /** DynamoDB client */
  DynamodbClient get dynamodb;
  
  /** S3 client */
  S3Client get s3;
  
  /** Client configuration */
  AwsConfig get config;
}

/* client implementation */
class _AwsClient implements AwsClient {
  factory _AwsClient(Module module) {
    var injector = new Injector(module);
    var rpcClient = injector.getInstance(AwsRpcClient);
    var dynamodbClient = new DynamodbClient(rpcClient);
    var s3Client = new S3Client(rpcClient);
    return new _AwsClient.init(dynamodbClient, s3Client);
  }
  
  _AwsClient.init(this.dynamodb, this.s3); 

  final DynamodbClient dynamodb;
  final S3Client s3;
  final AwsConfig config = new AwsConfig();
}

/* implementation bindings */
class _AwsModule extends Module {
  configure() {
    bind(AwsRpcClient).toInstance(new AwsRpcClient());
  }
}
