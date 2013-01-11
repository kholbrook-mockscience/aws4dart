// Copyright (c) 2013 Solvr, Inc. All rights reserved.
//
// This open source software is governed by the license terms
// specified in the LICENSE file

part of aws4dart_sqs;

/**
 * Client for Amazon Simple Queue Service API
 *
 * See http://docs.amazonwebservices.com/AWSSimpleQueueService/latest/APIReference
 */
class SQSClient extends AwsClient {
   SQSClient(AwsConfig config): super(config);

   createQueue() {
     throw "TODO";
   }

   listQueues()  {
     throw "TODO";
   }

   deleteQueue()  {
     throw "TODO";
   }

   getQueueAttributes()  {
     throw "TODO";
   }

   setQueueAttributes()  {
     throw "TODO";
   }

   sendMessage()  {
     throw "TODO";
   }

   receiveMessage() {
     throw "TODO";
   }

   deleteMessage()  {
     throw "TODO";
   }

   addPermission()  {
     throw "TODO";
   }

   removePermission() {
     throw "TODO";
   }

   changeMessageVisibility() {
     throw "TODO";
   }

   getQueueUrl() {
     throw "TODO";
   }

   sendMessageBatch() {
     throw "TODO";
   }

   deleteMessageBatch() {
     throw "TODO";
   }

   changeMessageVisibilityBatch() {
     throw "TODO";
   }
}
