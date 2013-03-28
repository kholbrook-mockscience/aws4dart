// Copyright (c) 2013, the project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed 
// by a Apache license that can be found in the LICENSE file.

part of aws4dart_s3;

/** Amazon S3 client */
abstract class S3Client {
  factory S3Client(AwsRpcClient rpcClient) => new _S3ClientImpl(rpcClient);
  // http://docs.aws.amazon.com/AWSJavaScriptSDK/latest/AWS/S3/Client.html
  // https://github.com/aws/aws-sdk-java/blob/master/src/main/java/com/amazonaws/services/s3/AmazonS3Client.java
  
  /**
   * Calls the AbortMultipartUpload API operation.
   *  
   * See also [Amazon S3 documentation for AbortMultipartUpload](http://docs.aws.amazon.com/AmazonS3/latest/API/mpUploadAbort.html)
   */
  abortMultipartUpload(AbortMultipartUploadRequest request) => throw "TODO";
  
  /**
   * Calls the CompleteMultipartUpload API operation.
   * 
   * See also [Amazon S3 documentation for CompleteMultipartUpload](http://docs.amazonwebservices.com/AmazonS3/latest/API/mpUploadComplete.html)
   */
  Future<CompleteMultipartUploadResponse> completeMultipartUpload(CompleteMultipartUploadRequest request)  => new Future.immediate(null);
  
  /**
   * Calls the CopyObject API operation.
   * 
   * See also [Amazon S3 documentation for CopyObject](http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTObjectCOPY.html)
   */
  Future<CopyObjectResponse> copyObject(String srcBucket, String srcKey, String destBucket, String destKey) => new Future.immediate(null);
  
  /**
   * Calls the CreateBucket API operation.
   * 
   * See also [Amazon S3 documentation for CreateBucket](http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTBucketPUT.html)
   */
  Future<Bucket> createBucket(String bucketName) => new Future.immediate(null);
  
  /**
   * Calls the CreateMultipartUpload API operation.
   * 
   * See also [Amazon S3 documentation for CreateMultipartUpload](http://docs.aws.amazon.com/AmazonS3/latest/API/mpUploadInitiate.html) 
   */
  Future<CreateMultipartUploadResponse> createMultipartUpload(final CreateMultipartUploadRequest request) => new Future.immediate(null);
  
  /**
   * Calls the DeleteBucket API operation.
   * 
   * See also [Amazon S3 documentation for DeleteBucket]()
   */
  deleteBucket(String bucketName) => throw "TODO";
  
  /**
   * Calls the DeleteBucketCors API operation.
   * 
   * See also [Amazon S3 documentation for DeleteBucketCors]() 
   */
  deleteBucketCors(String bucketName) => throw "TODO";

  /**
   *  Calls the DeleteBucketLifecycle API operation.
   *  
   *  See also [Amazon S3 documentation for DeleteBucketLifecycle]()
   */
  deleteBucketLifecycle(String bucketName) => throw "TODO";
 
  /**
   * Calls the DeleteBucketPolicy API operation.
   * 
   * See also [Amazon S3 documentation for DeleteBucketPolicy]()
   */
  deleteBucketPolicy(String bucketName) => throw "TODO";
  
  /**
   * Calls the DeleteBucketTagging API operation.
   * 
   * See also [Amazon S3 documentation for DeleteBucketTagging]()
   */
  deleteBucketTagging(String bucketName) => throw "TODO";

  /**
   * Calls the DeleteBucketWebsite API operation.
   * 
   * See also [Amazon S3 documentation for DeleteBucketWebsite]()
   */
  deleteBucketWebsite(String bucketName) => throw "TODO";

  /**
   * Calls the DeleteObject API operation.
   * 
   * See also [Amazon S3 documentation for DeleteObject]()
   */
  deleteObject(String bucketName, String key) => throw "TODO";
 
  /**
   * Calls the DeleteObjects API operation.
   * 
   * See also [Amazon S3 documentation for DeleteObjects]()
   */
  Future<DeleteObjectsResponse> deleteObjects(DeleteObjectsRequest request) => new Future.immediate(null);
  
  /**
   * Calls the GetBucketAcl API operation.
   * 
   * See also [Amazon S3 documentation for GetBucketAcl]()
   */
  Future getBucketAcl(params, callback) => new Future.immediate(null);

  /**
   * Calls the GetBucketCors API operation.
   * 
   * See also [Amazon S3 documentation for GetBucketCors]()
   */
  Future getBucketCors(params, callback) => new Future.immediate(null);
  
  /**
   * Calls the GetBucketLifecycle API operation.
   * 
   * See also [Amazon S3 documentation for GetBucketLifecycle]() 
   */
  Future getBucketLifecycle(params, callback) => new Future.immediate(null);

  /**
   * Calls the GetBucketLocation API operation.
   * 
   * See also [Amazon S3 documentation for GetBucketLocation]()
   */
  Future getBucketLocation(params, callback) => new Future.immediate(null);
 
  /**
   * Calls the GetBucketLogging API operation.
   * 
   * See also [Amazon S3 documentation for GetBucketLogging]()
   */
  Future getBucketLogging(params, callback) => new Future.immediate(null);

  /**
   * Calls the GetBucketNotification API operation.
   * 
   * See also [Amazon S3 documentation for GetBucketNotification]()
   */
  Future getBucketNotification(params, callback) => new Future.immediate(null);
 
  /**
   * Calls the GetBucketPolicy API operation.
   * 
   * See also [Amazon S3 documentation for GetBucketPolicy]()
   */
  Future getBucketPolicy(params, callback) => new Future.immediate(null);

  /**
   * Calls the GetBucketRequestPayment API operation.
   * 
   * See also [Amazon S3 documentation for GetBucketRequestPayment]()
   */
  Future getBucketRequestPayment(params, callback) => new Future.immediate(null);
 
  /**
   * Calls the GetBucketTagging API operation.
   * 
   * See also [Amazon S3 documentation for GetBucketTagging]() 
   */
  Future getBucketTagging(params, callback) => new Future.immediate(null);
  
  /**
   * Calls the GetBucketVersioning API operation.
   * 
   * See also [Amazon S3 documentation for GetBucketVersioning]()
   */
  Future getBucketVersioning(params, callback) => new Future.immediate(null);
  
  /**
   * Calls the GetBucketWebsite API operation.
   * 
   * See also [Amazon S3 documentation for GetBucketWebsite]()
   */
  Future getBucketWebsite(params, callback) => new Future.immediate(null);

  /**
   * Calls the GetObject API operation.
   * 
   * See also [Amazon S3 documentation for GetObject]()
   */
  Future getObject(params, callback) => new Future.immediate(null);

  /**
   * Calls the GetObjectAcl API operation.
   * 
   * See also [Amazon S3 documentation for GetObjectAcl]()
   */
  Future getObjectAcl(params, callback) => new Future.immediate(null);

  /**
   * Calls the GetObjectTorrent API operation.
   * 
   * See also [Amazon S3 documentation for GetObjectTorrent]() 
   */
  Future getObjectTorrent(params, callback) => new Future.immediate(null);

  /**
   * Calls the HeadBucket API operation.
   * 
   * See also [Amazon S3 documentation for HeadBucket]()
   */
  Future headBucket(params, callback) => new Future.immediate(null);
 
  /**
   * Calls the HeadObject API operation.
   * 
   * See also [Amazon S3 documentation for HeadObject]()
   */
  Future headObject(params, callback) => new Future.immediate(null);
  
  /**
   * Calls the ListBuckets API operation.
   * 
   * See also [Amazon S3 documentation for ListBuckets](http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTServiceGET.html)
   */
  Future<List<Bucket>> listBuckets();
  
  /**
   * Calls the ListMultipartUploads API operation.
   * 
   * See also [Amazon S3 documentation for ListMultipartUploads]()
   */
  Future listMultipartUploads(params, callback) => new Future.immediate(null);
 
  /**
   * Calls the ListObjects API operation.
   * 
   * See also [Amazon S3 documentation for ListObjects]()
   */
  Future listObjects(params, callback) => new Future.immediate(null);
 
  /**
   * Calls the ListObjectVersions API operation.
   * 
   * See also [Amazon S3 documentation for ListObjectVersions]()
   */
  Future listObjectVersions(params, callback) => new Future.immediate(null);
 
  /**
   * Calls the ListParts API operation.
   * 
   * See also [Amazon S3 documentation for ListParts]()
   */
  Future listParts(params, callback) => new Future.immediate(null);
 
  /**
   * Calls the PutBucketAcl API operation.
   * 
   * See also [Amazon S3 documentation for PutBucketAcl]()
   */
  Future putBucketAcl(params, callback) => new Future.immediate(null);
  
  /**
   * Calls the PutBucketCors API operation.
   * 
   * See also [Amazon S3 documentation for PutBucketCors]()
   */
  Future putBucketCors(params, callback) => new Future.immediate(null);
  
  /**
   * Calls the PutBucketLifecycle API operation.
   * 
   * See also [Amazon S3 documentation for PutBucketLifecycle]()
   */
  Future putBucketLifecycle(params, callback) => new Future.immediate(null);
  
  /**
   * Calls the PutBucketLogging API operation.
   * 
   * See also [Amazon S3 documentation for PutBucketLogging]()
   */
  Future putBucketLogging(params, callback) => new Future.immediate(null);
 
  /**
   * Calls the PutBucketNotification API operation.
   * 
   * See also [Amazon S3 documentation for PutBucketNotification]()
   */
  Future putBucketNotification(params, callback) => new Future.immediate(null);
  
  /**
   * Calls the PutBucketPolicy API operation.
   * 
   * See also [Amazon S3 documentation for PutBucketPolicy]()
   */
  Future putBucketPolicy(params, callback) => new Future.immediate(null);

  /**
   * Calls the PutBucketRequestPayment API operation.
   * 
   * See also [Amazon S3 documentation for PutBucketRequestPayment]()
   */
  Future putBucketRequestPayment(params, callback) => new Future.immediate(null);
  
  /**
   * Calls the PutBucketTagging API operation.
   * 
   * See also [Amazon S3 documentation for PutBucketTagging]()
   */
  Future putBucketTagging(params, callback) => new Future.immediate(null);
  
  /**
   * Calls the PutBucketVersioning API operation.
   * 
   * See also [Amazon S3 documentation for PutBucketVersioning]()
   */
  Future putBucketVersioning(params, callback) => new Future.immediate(null);
  
  /**
   * Calls the PutBucketWebsite API operation.
   * 
   * See also [Amazon S3 documentation for PutBucketWebsite]()
   */
  Future putBucketWebsite(params, callback) => new Future.immediate(null);
  
  /**
   * Calls the PutObject API operation.
   * 
   * See also [Amazon S3 documentation for PutObject]()
   */
  Future<PutObjectResponse> putObject(String bucketName, String key, Stream data, [ObjectMetadata metadata = null]) => new Future.immediate(null);
  
  /**
   * Calls the PutObjectAcl API operation.
   * 
   * See also [Amazon S3 documentation for PutObjectAcl]()
   */
  Future putObjectAcl(params, callback) => new Future.immediate(null);
  
  /**
   * Calls the RestoreObject API operation.
   * 
   * See also [Amazon S3 documentation for RestoreObject]()
   */
  Future restoreObject(params, callback) => new Future.immediate(null);
  
  /**
   *  Calls the UploadPart API operation.
   *  
   *  See also [Amazon S3 documentation for UploadPart]()
   */
  Future uploadPart(params, callback) => new Future.immediate(null);
  
  /**
   * Calls the UploadPartCopy API operation.
   * 
   * See also [Amazon S3 documentation for UploadPartCopy]()
   */
  Future uploadPartCopy(params, callback) => new Future.immediate(null);
}
