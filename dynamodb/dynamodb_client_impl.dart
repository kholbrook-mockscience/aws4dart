// Copyright (c) 2012 Qalqo, all rights reserved. 
//
// This open source software is governed by the license terms 
// specified in the LICENSE file

// TODO https://github.com/SaltwaterC/aws2js and https://github.com/Wantworthy/dynode/blob/master/lib/dynode/client.js

class _DynamoDbClientImpl extends AwsClient implements DynamoDbClient {
  _DynamoDbClientImpl(AwsConfig config)
    : _requester = new _DynamoDbRequester(config),
      super(config);
  
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
  
  Future<Map> listTables() => _request("ListTables");
  
  Future<Map> describeTable(String tableName) => _request("DescribeTable", {"TableName": tableName});
  
  updateTable(String tablename) {
    throw "TODO";
  }
  
  Future<Map> deleteTable(String tablename)  => _request("DeleteTable", {"TableName": tableName}); 
  
  putItem(String tablename, Map jsonItem) {
    throw "TODO";
  }
  
  updateItem(String tablename, String itemHash,  Map itemAttributes) {
    throw "TODO";
  }
  
  getItem(String tablename, String itemHash) {
    throw "TODO";
  }
  
  deleteItem(String tablename, String itemHash) {
    throw "TODO";
  }
  
  query(String tablename, String itemHash) {
    throw "TODO";
  }
  
  scan(String tablename, Map options) {
    throw "TODO";
  }
  
  batchGetItem(Map<String, Map> batchQuery) {
    throw "TODO";
  }
  
  Future<Map> _request(String action, [Map options = const {}]) => _requester.send(action, options, httpClient);
  
  final _DynamoDbRequester _requester;
}

