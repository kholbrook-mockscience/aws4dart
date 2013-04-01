// Copyright (c) 2013, the project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed 
// by a Apache license that can be found in the LICENSE file.

part of aws4dart_dynamodb;

/** Amazon DynamoDB client */
abstract class DynamodbClient {
  factory DynamodbClient(AwsRpcClient rpcClient) => new _DynamodbClientImpl(rpcClient);
  
  /**
   * Calls the BatchGetItem API operation.
   * 
   * See also [Amazon DynamoDB Documentation for BatchGetItem](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/API_BatchGetItems.html)
   */
  Future<BatchGetItemResponse> batchGetItem(final BatchGetItemRequest request);
  
  /**
   * Calls the BatchWriteItem API operation.
   * 
   * See also [Amazon DynamoDB Documentation for BatchWriteItem](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/API_BatchWriteItem.html)
   */
  Future<BatchWriteItemResponse> batchWriteItem(final BatchWriteItemRequest request);
  
  /**
   * Calls the CreateTable API operation.
   * 
   * See also [Amazon DynamoDB Documentation for CreateTable](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/API_CreateTable.html)
   */
  Future<CreateTableResponse> createTable(final CreateTableRequest request); 
  
  /**
   * Calls the DeleteItem API operation.
   * 
   * See also [Amazon DynamoDB Documentation for DeleteItem](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/API_DeleteItem.html)
   */
  Future<DeleteItemResponse> deleteItem(final DeleteItemRequest request);
  
  /**
   * Calls the DeleteTable API operation.
   * 
   * See also [Amazon DynamoDB Documentation for DeleteTable](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/API_DeleteTable.html)
   */
  Future<DeleteTableResponse> deleteTable(final DeleteTableRequest request);
  
  /**
   * Calls the DescribeTable API operation.
   * 
   * See also [Amazon DynamoDB Documentation for DescribeTable](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/API_DescribeTable.html)
   */
  Future<DescribeTableResponse> describeTable(final DescribeTableRequest request);
  
  /**
   * Calls the GetItem API operation.
   * 
   * See also [Amazon DynamoDB Documentation for GetItem](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/API_GetItem.html)
   */
  Future<GetItemResponse> getItem(final GetItemRequest request);
  
  /**
   * Calls the ListTables API operation.
   * 
   * See also [Amazon DynamoDB Documentation for ListTables](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/API_ListTables.html)
   */
  Future<ListTablesResponse> listTables(final ListTablesRequest request);
  
  /**
   * Calls the PutItem API operation.
   * 
   * See also [Amazon DynamoDB Documentation for PutItem](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/API_PutItem.html)
   */
  Future<PutItemResponse> putItem(final PutItemRequest request);
  
  /**
   * Calls the Query API operation.
   * 
   * See also [Amazon DynamoDB Documentation for Query](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/API_Query.html)
   */
  Future<QueryResponse> query(final QueryRequest request);
  
  /**
   * Calls the Scan API operation.
   * 
   * See also [Amazon DynamoDB Documentation for Scan](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/API_Scan.html)
   */
  Future<ScanResponse> scan(final ScanRequest request);
  
  /**
   * Calls the UpdateItem API operation.
   * 
   * See also [Amazon DynamoDB Documentation for UpdateItem](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/API_UpdateItem.html)
   */
  Future<UpdateItemResponse> updateItem(final UpdateItemRequest request);
  
  /**
   * Calls the UpdateTable API operation.
   * 
   * See also [Amazon DynamoDB Documentation for UpdateTable](http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/API_UpdateTable.html)
   */
  Future<UpdateTableResponse> updateTable(final UpdateTableRequest request);
}

