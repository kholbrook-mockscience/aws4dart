// Copyright (c) 2013 Solvr, Inc. All rights reserved.
//
// This open source software is governed by the license terms
// specified in the LICENSE file

part of aws4dart_dynamo;

/*
 * https://github.com/Wantworthy/dynode/blob/master/lib/dynode/client.js
 * https://github.com/xiepeng/dynamoDB
 * https://github.com/SaltwaterC/aws2js
 */
class _DynamoDbClientImpl extends AwsClient implements DynamoDbClient {
  _DynamoDbClientImpl(AwsConfig config)
    : _requester = new _DynamoDbRequester(config),
      super(config);

  @override
  Future<Map> createTable(String tableName) {
    var options = {
      "TableName": tableName,
      "ProvisionedThroughput": {
        "ReadCapacityUnits":10,
        "WriteCapacityUnits":5
       },
       "KeySchema": {
         "HashKeyElement":{
           "AttributeName": "id",
           "AttributeType": "String"
          }
       }
    };
    return _request("CreateTable", options);
  }

  @override
  Future<Map> listTables() => _request("ListTables");

  @override
  Future<Map> describeTable(String tableName) => _request("DescribeTable", {"TableName": tableName});

  @override
  updateTable(String tablename) {
    throw "TODO";
  }

  @override
  Future<Map> deleteTable(String tableName)  => _request("DeleteTable", {"TableName": tableName});
  
  @override
  putItem(String tablename, Map jsonItem) {
    throw "TODO";
  }

  @override
  updateItem(String tablename, String itemHash,  Map itemAttributes) {
    throw "TODO";
  }

  @override
  getItem(String tablename, String itemHash) {
    throw "TODO";
  }

  @override
  deleteItem(String tablename, String itemHash) {
    throw "TODO";
  }

  @override
  query(String tablename, String itemHash) {
    throw "TODO";
  }

  @override
  scan(String tablename, Map options) {
    throw "TODO";
  }

  @override
  batchGetItem(Map<String, Map> batchQuery) {
    throw "TODO";
  }

  Future<Map> _request(String action, [Map options = const {}]) => _requester.send(action, options, httpClient);

  final _DynamoDbRequester _requester;
}

