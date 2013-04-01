// Copyright (c) 2013, the project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed 
// by a Apache license that can be found in the LICENSE file.

part of aws4dart_s3;

/** Amazon S3 client */
abstract class S3Client {
  factory S3Client(AwsRpcClient rpcClient) => new _S3ClientImpl(rpcClient);
  
  /**
   * Calls the AbortMultipartUpload API operation.
   *  
   * See also [Amazon S3 documentation for AbortMultipartUpload](http://docs.aws.amazon.com/AmazonS3/latest/API/mpUploadAbort.html)
   */
  abortMultipartUpload(AbortMultipartUploadRequest request);
  
  /**
   * Calls the CompleteMultipartUpload API operation.
   * 
   * See also [Amazon S3 documentation for CompleteMultipartUpload](http://docs.amazonwebservices.com/AmazonS3/latest/API/mpUploadComplete.html)
   */
  Future<CompleteMultipartUploadResponse> completeMultipartUpload(CompleteMultipartUploadRequest request);
  
  /**
   * Calls the CopyObject API operation.
   * 
   * See also [Amazon S3 documentation for CopyObject](http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTObjectCOPY.html)
   */
  Future<CopyObjectResponse> copyObject(String srcBucket, String srcKey, String destBucket, String destKey);
  
  /**
   * Calls the CreateBucket API operation.
   * 
   * See also [Amazon S3 documentation for CreateBucket](http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTBucketPUT.html)
   */
  Future<Bucket> createBucket(String bucketName);
  
  /**
   * Calls the CreateMultipartUpload API operation.
   * 
   * See also [Amazon S3 documentation for CreateMultipartUpload](http://docs.aws.amazon.com/AmazonS3/latest/API/mpUploadInitiate.html) 
   */
  Future<CreateMultipartUploadResponse> createMultipartUpload(final CreateMultipartUploadRequest request);
  
  /**
   * Calls the DeleteBucket API operation.
   * 
   * See also [Amazon S3 documentation for DeleteBucket]()
   */
  deleteBucket(String bucketName);
  
  /**
   * Calls the DeleteBucketCors API operation.
   * 
   * See also [Amazon S3 documentation for DeleteBucketCors]() 
   */
  deleteBucketCors(String bucketName);

  /**
   *  Calls the DeleteBucketLifecycle API operation.
   *  
   *  See also [Amazon S3 documentation for DeleteBucketLifecycle]()
   */
  deleteBucketLifecycle(String bucketName);
 
  /**
   * Calls the DeleteBucketPolicy API operation.
   * 
   * See also [Amazon S3 documentation for DeleteBucketPolicy]()
   */
  deleteBucketPolicy(String bucketName);
  
  /**
   * Calls the DeleteBucketTagging API operation.
   * 
   * See also [Amazon S3 documentation for DeleteBucketTagging]()
   */
  deleteBucketTagging(String bucketName);

  /**
   * Calls the DeleteBucketWebsite API operation.
   * 
   * See also [Amazon S3 documentation for DeleteBucketWebsite]()
   */
  deleteBucketWebsite(String bucketName);

  /**
   * Calls the DeleteObject API operation.
   * 
   * See also [Amazon S3 documentation for DeleteObject]()
   */
  deleteObject(String bucketName, String key);
 
  /**
   * Calls the DeleteObjects API operation.
   * 
   * See also [Amazon S3 documentation for DeleteObjects]()
   */
  Future<DeleteObjectsResponse> deleteObjects(DeleteObjectsRequest request);
  
  /**
   * Calls the GetBucketAcl API operation.
   * 
   * See also [Amazon S3 documentation for GetBucketAcl]()
   */
  Future getBucketAcl(params, callback);

  /**
   * Calls the GetBucketCors API operation.
   * 
   * See also [Amazon S3 documentation for GetBucketCors]()
   */
  Future getBucketCors(params, callback);
  
  /**
   * Calls the GetBucketLifecycle API operation.
   * 
   * See also [Amazon S3 documentation for GetBucketLifecycle]() 
   */
  Future getBucketLifecycle(params, callback);

  /**
   * Calls the GetBucketLocation API operation.
   * 
   * See also [Amazon S3 documentation for GetBucketLocation]()
   */
  Future getBucketLocation(params, callback);
 
  /**
   * Calls the GetBucketLogging API operation.
   * 
   * See also [Amazon S3 documentation for GetBucketLogging]()
   */
  Future getBucketLogging(params, callback);

  /**
   * Calls the GetBucketNotification API operation.
   * 
   * See also [Amazon S3 documentation for GetBucketNotification]()
   */
  Future getBucketNotification(params, callback);
 
  /**
   * Calls the GetBucketPolicy API operation.
   * 
   * See also [Amazon S3 documentation for GetBucketPolicy]()
   */
  Future getBucketPolicy(params, callback);

  /**
   * Calls the GetBucketRequestPayment API operation.
   * 
   * See also [Amazon S3 documentation for GetBucketRequestPayment]()
   */
  Future getBucketRequestPayment(params, callback);
 
  /**
   * Calls the GetBucketTagging API operation.
   * 
   * See also [Amazon S3 documentation for GetBucketTagging]() 
   */
  Future getBucketTagging(params, callback);
  
  /**
   * Calls the GetBucketVersioning API operation.
   * 
   * See also [Amazon S3 documentation for GetBucketVersioning]()
   */
  Future getBucketVersioning(params, callback);
  
  /**
   * Calls the GetBucketWebsite API operation.
   * 
   * See also [Amazon S3 documentation for GetBucketWebsite]()
   */
  Future getBucketWebsite(params, callback);

  /**
   * Calls the GetObject API operation.
   * 
   * See also [Amazon S3 documentation for GetObject]()
   */
  Future getObject(params, callback);

  /**
   * Calls the GetObjectAcl API operation.
   * 
   * See also [Amazon S3 documentation for GetObjectAcl]()
   */
  Future getObjectAcl(params, callback);

  /**
   * Calls the GetObjectTorrent API operation.
   * 
   * See also [Amazon S3 documentation for GetObjectTorrent]() 
   */
  Future getObjectTorrent(params, callback);

  /**
   * Calls the HeadBucket API operation.
   * 
   * See also [Amazon S3 documentation for HeadBucket]()
   */
  Future headBucket(params, callback);
 
  /**
   * Calls the HeadObject API operation.
   * 
   * See also [Amazon S3 documentation for HeadObject]()
   */
  Future headObject(params, callback);
  
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
  Future listMultipartUploads(params, callback);
 
  /**
   * Calls the ListObjects API operation.
   * 
   * See also [Amazon S3 documentation for ListObjects]()
   */
  Future listObjects(params, callback);
 
  /**
   * Calls the ListObjectVersions API operation.
   * 
   * See also [Amazon S3 documentation for ListObjectVersions]()
   */
  Future listObjectVersions(params, callback);
 
  /**
   * Calls the ListParts API operation.
   * 
   * See also [Amazon S3 documentation for ListParts]()
   */
  Future listParts(params, callback);
 
  /**
   * Calls the PutBucketAcl API operation.
   * 
   * See also [Amazon S3 documentation for PutBucketAcl]()
   */
  Future putBucketAcl(params, callback);
  
  /**
   * Calls the PutBucketCors API operation.
   * 
   * See also [Amazon S3 documentation for PutBucketCors]()
   */
  Future putBucketCors(params, callback);
  
  /**
   * Calls the PutBucketLifecycle API operation.
   * 
   * See also [Amazon S3 documentation for PutBucketLifecycle]()
   */
  Future putBucketLifecycle(params, callback);
  
  /**
   * Calls the PutBucketLogging API operation.
   * 
   * See also [Amazon S3 documentation for PutBucketLogging]()
   */
  Future putBucketLogging(params, callback);
 
  /**
   * Calls the PutBucketNotification API operation.
   * 
   * See also [Amazon S3 documentation for PutBucketNotification]()
   */
  Future putBucketNotification(params, callback);
  
  /**
   * Calls the PutBucketPolicy API operation.
   * 
   * See also [Amazon S3 documentation for PutBucketPolicy]()
   */
  Future putBucketPolicy(params, callback);

  /**
   * Calls the PutBucketRequestPayment API operation.
   * 
   * See also [Amazon S3 documentation for PutBucketRequestPayment]()
   */
  Future putBucketRequestPayment(params, callback);
  
  /**
   * Calls the PutBucketTagging API operation.
   * 
   * See also [Amazon S3 documentation for PutBucketTagging]()
   */
  Future putBucketTagging(params, callback);
  
  /**
   * Calls the PutBucketVersioning API operation.
   * 
   * See also [Amazon S3 documentation for PutBucketVersioning]()
   */
  Future putBucketVersioning(params, callback);
  
  /**
   * Calls the PutBucketWebsite API operation.
   * 
   * See also [Amazon S3 documentation for PutBucketWebsite]()
   */
  Future putBucketWebsite(params, callback);
  
  /**
   * Calls the PutObject API operation.
   * 
   * See also [Amazon S3 documentation for PutObject]()
   */
  Future<PutObjectResponse> putObject(String bucketName, String key, Stream data, [ObjectMetadata metadata = null]);
  
  /**
   * Calls the PutObjectAcl API operation.
   * 
   * See also [Amazon S3 documentation for PutObjectAcl]()
   */
  Future putObjectAcl(params, callback);
  
  /**
   * Calls the RestoreObject API operation.
   * 
   * See also [Amazon S3 documentation for RestoreObject]()
   */
  Future restoreObject(params, callback);
  
  /**
   *  Calls the UploadPart API operation.
   *  
   *  See also [Amazon S3 documentation for UploadPart]()
   */
  Future uploadPart(params, callback);
  
  /**
   * Calls the UploadPartCopy API operation.
   * 
   * See also [Amazon S3 documentation for UploadPartCopy]()
   */
  Future uploadPartCopy(params, callback);
}
