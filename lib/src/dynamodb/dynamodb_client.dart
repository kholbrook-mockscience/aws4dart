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

part of aws4dart_dynamodb;

/**
 * Amazon DynamoDB client
 */
class DynamodbClient {
  // http://docs.aws.amazon.com/AWSJavaScriptSDK/latest/AWS/DynamoDB/Client.html
  // https://github.com/aws/aws-sdk-java/blob/master/src/main/java/com/amazonaws/services/dynamodb/AmazonDynamoDBAsyncClient.java
  
  factory DynamodbClient(Injector injector) {
    var rpcClient = injector.getInstance(AwsRpcClient);
    return new DynamodbClient._internal(rpcClient);
  }
  
  DynamodbClient._internal(this._rpcClient);
  
  /**
   * Calls the BatchGetItem API operation.
   * 
   * See also [Amazon DynamoDB Documentation for BatchGetItem](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/API_BatchGetItems.html)
   */
  Future<BatchGetItemResponse> batchGetItem(final BatchGetItemRequest request) => new Future.immediate(null);
  
  /**
   * Calls the BatchWriteItem API operation.
   * 
   * See also [Amazon DynamoDB Documentation for BatchWriteItem](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/API_BatchWriteItem.html)
   */
  Future<BatchWriteItemResponse> batchWriteItem(final BatchWriteItemRequest request) => new Future.immediate(null);
  
  /**
   * Calls the CreateTable API operation.
   * 
   * See also [Amazon DynamoDB Documentation for CreateTable](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/API_CreateTable.html)
   */
  Future<CreateTableResponse> createTable(final CreateTableRequest request) => new Future.immediate(null); 
  
  /**
   * Calls the DeleteItem API operation.
   * 
   * See also [Amazon DynamoDB Documentation for DeleteItem](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/API_DeleteItem.html)
   */
  Future<DeleteItemResponse> deleteItem(final DeleteItemRequest request) => new Future.immediate(null);
  
  /**
   * Calls the DeleteTable API operation.
   * 
   * See also [Amazon DynamoDB Documentation for DeleteTable](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/API_DeleteTable.html)
   */
  Future<DeleteTableResponse> deleteTable(final DeleteTableRequest request) => new Future.immediate(null);
  
  /**
   * Calls the DescribeTable API operation.
   * 
   * See also [Amazon DynamoDB Documentation for DescribeTable](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/API_DescribeTable.html)
   */
  Future<DescribeTableResponse> describeTable(final DescribeTableRequest request) => new Future.immediate(null);
  
  /**
   * Calls the GetItem API operation.
   * 
   * See also [Amazon DynamoDB Documentation for GetItem](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/API_GetItem.html)
   */
  Future<GetItemResponse> getItem(final GetItemRequest request) => new Future.immediate(null);
  
  /**
   * Calls the ListTables API operation.
   * 
   * See also [Amazon DynamoDB Documentation for ListTables](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/API_ListTables.html)
   */
  Future<ListTablesResponse> listTables(final ListTablesRequest request) => new Future.immediate(null);
  
  /**
   * Calls the PutItem API operation.
   * 
   * See also [Amazon DynamoDB Documentation for PutItem](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/API_PutItem.html)
   */
  Future<PutItemResponse> putItem(final PutItemRequest request) => new Future.immediate(null);
  
  /**
   * Calls the Query API operation.
   * 
   * See also [Amazon DynamoDB Documentation for Query](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/API_Query.html)
   */
  Future<QueryResponse> query(final QueryRequest request) => new Future.immediate(null);
  
  /**
   * Calls the Scan API operation.
   * 
   * See also [Amazon DynamoDB Documentation for Scan](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/API_Scan.html)
   */
  Future<ScanResponse> scan(final ScanRequest request) => new Future.immediate(null);
  
  /**
   * Calls the UpdateItem API operation.
   * 
   * See also [Amazon DynamoDB Documentation for UpdateItem](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/API_UpdateItem.html)
   */
  Future<UpdateItemResponse> updateItem(final UpdateItemRequest request) => new Future.immediate(null);
  
  /**
   * Calls the UpdateTable API operation.
   * 
   * See also [Amazon DynamoDB Documentation for UpdateTable](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/API_UpdateTable.html)
   */
  Future<UpdateTableResponse> updateTable(final UpdateTableRequest request) => new Future.immediate(null);

  final AwsRpcClient _rpcClient;
}

