part of aws4dart_dynamodb;

// Copyright (c) 2013 Solvr, Inc. All rights reserved.
//
// This open source software is governed by the license terms
// specified in the LICENSE file

// TODO https://github.com/SaltwaterC/aws2js and https://github.com/Wantworthy/dynode/blob/master/lib/dynode/client.js
// TODO check new HTTP auth v4 at http://docs.amazonwebservices.com/amazondynamodb/latest/developerguide/MakingHTTPRequests.html

/**
 * Client for Amazon DynamoDB API
 *
 * See http://docs.amazonwebservices.com/amazondynamodb/latest/developerguide/API.html
 */
abstract class DynamoDbClient  {
  factory DynamoDbClient(AwsConfig config) => new _DynamoDbClientImpl(config);

  /**
   * Create a new table. Returns when table is created.
   */
  Future<Map> createTable(String tablename);

  /**
   * Get map of all the tables associated with the current account
   */
  Future<Map> listTables();

  /**
   * Get information about the table such as status of the table, primary key schema etc.
   */
  Future<Map> describeTable(String tableName);

  /**
   * Updates the provisioned throughput for the given table
   */
  updateTable(String tablename);

  /**
   * Delete a table. Returns when table is deleted.
   */
  Future<Map> deleteTable(String tablename);

  /**
   * Creates a new item, or replaces an old item with a new item (including all the attributes)
   */
  putItem(String tablename, Map jsonItem);

  /**
   * Edits an existing item's attributes
   */
  updateItem(String tablename, String itemHash,  Map itemAttributes);

  /**
   * Returns a set of Attributes for an item that matches the primary key
   */
  getItem(String tablename, String itemHash);

  /**
   * Deletes a single item in a table by primary key
   */
  deleteItem(String tablename, String itemHash);

  /**
   * Gets the values of one or more items and their attributes by primary key
   */
  query(String tablename, String itemHash);

  /**
   * Returns one or more items and its attributes by performing a full scan of a table
   */
  scan(String tablename, Map options);

  /**
   * Returns the attributes for multiple items from multiple tables using their primary keys
   */
  batchGetItem(Map<String, Map> batchQuery);
}

