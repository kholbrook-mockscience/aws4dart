// Copyright (c) 2013, the project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed 
// by a Apache license that can be found in the LICENSE file.

part of aws4dart_s3;

/**
 * Amazon S3 client
 */
class S3Client {
  // http://docs.aws.amazon.com/AWSJavaScriptSDK/latest/AWS/S3/Client.html
  // https://github.com/aws/aws-sdk-java/blob/master/src/main/java/com/amazonaws/services/s3/AmazonS3Client.java
  
  factory S3Client(Injector injector) {
    var rpcClient = injector.getInstance(AwsRpcClient);
    return new S3Client._internal(rpcClient);
  }
  
  S3Client._internal(this._rpcClient);
  
  /**
   *  Calls the AbortMultipartUpload API operation.
   *  
   *  See also [Amazon S3 Documentation for AbortMultipartUpload](http://docs.aws.amazon.com/AmazonS3/latest/API/mpUploadAbort.html)
   */
  abortMultipartUpload(AbortMultipartUploadRequest request) => throw "TODO";
  
  /**
   * Calls the CompleteMultipartUpload API operation.
   * 
   * See also [Amazon S3 Documentation for CompleteMultipartUpload](http://docs.amazonwebservices.com/AmazonS3/latest/API/mpUploadComplete.html)
   */
  Future<CompleteMultipartUploadResponse> completeMultipartUpload(CompleteMultipartUploadRequest request)  => new Future.immediate(null);
  
  /**
   * Calls the CopyObject API operation.
   * 
   * See also [Amazon S3 Documentation for CopyObject](http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTObjectCOPY.html)
   */
  Future<CopyObjectResponse> copyObject(String srcBucket, String srcKey, String destBucket, String destKey) => new Future.immediate(null);
  
  /**
   * Calls the CreateBucket API operation.
   * 
   * See also [Amazon S3 Documentation for CreateBucket](http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTBucketPUT.html)
   */
  Future<Bucket> createBucket(String bucketName) => new Future.immediate(null);
  
  /**
   * Calls the CreateMultipartUpload API operation.
   * 
   * See also [Amazon S3 Documentation for CreateMultipartUpload](http://docs.aws.amazon.com/AmazonS3/latest/API/mpUploadInitiate.html) 
   */
  Future<CreateMultipartUploadResponse> createMultipartUpload(final CreateMultipartUploadRequest request) => new Future.immediate(null);
  
  /**
   * Calls the DeleteBucket API operation.
   * 
   * See also [Amazon S3 Documentation for DeleteBucket]()
   */
  deleteBucket(String bucketName) => throw "TODO";
  
  /**
   * Calls the DeleteBucketCors API operation.
   * 
   * See also [Amazon S3 Documentation for DeleteBucketCors]() 
   */
  deleteBucketCors(String bucketName) => throw "TODO";

  /**
   *  Calls the DeleteBucketLifecycle API operation.
   *  
   *  See also [Amazon S3 Documentation for DeleteBucketLifecycle]()
   */
  deleteBucketLifecycle(String bucketName) => throw "TODO";
 
  /**
   * Calls the DeleteBucketPolicy API operation.
   * 
   * See also [Amazon S3 Documentation for DeleteBucketPolicy]()
   */
  deleteBucketPolicy(String bucketName) => throw "TODO";
  
  /**
   * Calls the DeleteBucketTagging API operation.
   * 
   * See also [Amazon S3 Documentation for DeleteBucketTagging]()
   */
  deleteBucketTagging(String bucketName) => throw "TODO";

  /**
   * Calls the DeleteBucketWebsite API operation.
   * 
   * See also [Amazon S3 Documentation for DeleteBucketWebsite]()
   */
  deleteBucketWebsite(String bucketName) => throw "TODO";

  /**
   * Calls the DeleteObject API operation.
   * 
   * See also [Amazon S3 Documentation for DeleteObject]()
   */
  deleteObject(String bucketName, String key) => throw "TODO";
 
  /**
   * Calls the DeleteObjects API operation.
   * 
   * See also [Amazon S3 Documentation for DeleteObjects]()
   */
  Future<DeleteObjectsResponse> deleteObjects(DeleteObjectsRequest request) => new Future.immediate(null);
  
  /**
   * Calls the GetBucketAcl API operation.
   * 
   * See also [Amazon S3 Documentation for GetBucketAcl]()
   */
  Future getBucketAcl(params, callback) => new Future.immediate(null);

  /**
   * Calls the GetBucketCors API operation.
   * 
   * See also [Amazon S3 Documentation for GetBucketCors]()
   */
  Future getBucketCors(params, callback) => new Future.immediate(null);
  
  /**
   * Calls the GetBucketLifecycle API operation.
   * 
   * See also [Amazon S3 Documentation for GetBucketLifecycle]() 
   */
  Future getBucketLifecycle(params, callback) => new Future.immediate(null);

  /**
   * Calls the GetBucketLocation API operation.
   * 
   * See also [Amazon S3 Documentation for GetBucketLocation]()
   */
  Future getBucketLocation(params, callback) => new Future.immediate(null);
 
  /**
   * Calls the GetBucketLogging API operation.
   * 
   * See also [Amazon S3 Documentation for GetBucketLogging]()
   */
  Future getBucketLogging(params, callback) => new Future.immediate(null);

  /**
   * Calls the GetBucketNotification API operation.
   * 
   * See also [Amazon S3 Documentation for GetBucketNotification]()
   */
  Future getBucketNotification(params, callback) => new Future.immediate(null);
 
  /**
   * Calls the GetBucketPolicy API operation.
   * 
   * See also [Amazon S3 Documentation for GetBucketPolicy]()
   */
  Future getBucketPolicy(params, callback) => new Future.immediate(null);

  /**
   * Calls the GetBucketRequestPayment API operation.
   * 
   * See also [Amazon S3 Documentation for GetBucketRequestPayment]()
   */
  Future getBucketRequestPayment(params, callback) => new Future.immediate(null);
 
  /**
   * Calls the GetBucketTagging API operation.
   * 
   * See also [Amazon S3 Documentation for GetBucketTagging]() 
   */
  Future getBucketTagging(params, callback) => new Future.immediate(null);
  
  /**
   * Calls the GetBucketVersioning API operation.
   * 
   * See also [Amazon S3 Documentation for GetBucketVersioning]()
   */
  Future getBucketVersioning(params, callback) => new Future.immediate(null);
  
  /**
   * Calls the GetBucketWebsite API operation.
   * 
   * See also [Amazon S3 Documentation for GetBucketWebsite]()
   */
  Future getBucketWebsite(params, callback) => new Future.immediate(null);

  /**
   * Calls the GetObject API operation.
   * 
   * See also [Amazon S3 Documentation for GetObject]()
   */
  Future getObject(params, callback) => new Future.immediate(null);

  /**
   * Calls the GetObjectAcl API operation.
   * 
   * See also [Amazon S3 Documentation for GetObjectAcl]()
   */
  Future getObjectAcl(params, callback) => new Future.immediate(null);

  /**
   * Calls the GetObjectTorrent API operation.
   * 
   * See also [Amazon S3 Documentation for GetObjectTorrent]() 
   */
  Future getObjectTorrent(params, callback) => new Future.immediate(null);

  /**
   * Calls the HeadBucket API operation.
   * 
   * See also [Amazon S3 Documentation for HeadBucket]()
   */
  Future headBucket(params, callback) => new Future.immediate(null);
 
  /**
   * Calls the HeadObject API operation.
   * 
   * See also [Amazon S3 Documentation for HeadObject]()
   */
  Future headObject(params, callback) => new Future.immediate(null);
  
  

  /**
   * Calls the ListBuckets API operation.
   * 
   * See also [Amazon S3 Documentation for ListBuckets](http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTServiceGET.html)
   */
  Future<List<Bucket>> listBuckets() {
    var completer = new Completer<List<Bucket>>();
    var request = new ListBucketsRequest();
    _rpcClient.getXml(request).then((String xml) {
      var dom = XML.parse(xml);
      var response = new ListBucketsResponse._fromXml(dom);
      completer.complete(response.buckets);
    });
    return completer.future;
  }
  
  /**
   * Calls the ListMultipartUploads API operation.
   * 
   * See also [Amazon S3 Documentation for ListMultipartUploads]()
   */
  Future listMultipartUploads(params, callback) => new Future.immediate(null);
 
  /**
   * Calls the ListObjects API operation.
   * 
   * See also [Amazon S3 Documentation for ListObjects]()
   */
  Future listObjects(params, callback) => new Future.immediate(null);
 
  /**
   * Calls the ListObjectVersions API operation.
   * 
   * See also [Amazon S3 Documentation for ListObjectVersions]()
   */
  Future listObjectVersions(params, callback) => new Future.immediate(null);
 
  /**
   * Calls the ListParts API operation.
   * 
   * See also [Amazon S3 Documentation for ListParts]()
   */
  Future listParts(params, callback) => new Future.immediate(null);
 
  /**
   * Calls the PutBucketAcl API operation.
   * 
   * See also [Amazon S3 Documentation for PutBucketAcl]()
   */
  Future putBucketAcl(params, callback) => new Future.immediate(null);
  
  /**
   * Calls the PutBucketCors API operation.
   * 
   * See also [Amazon S3 Documentation for PutBucketCors]()
   */
  Future putBucketCors(params, callback) => new Future.immediate(null);
  
  /**
   * Calls the PutBucketLifecycle API operation.
   * 
   * See also [Amazon S3 Documentation for PutBucketLifecycle]()
   */
  Future putBucketLifecycle(params, callback) => new Future.immediate(null);
  
  /**
   * Calls the PutBucketLogging API operation.
   * 
   * See also [Amazon S3 Documentation for PutBucketLogging]()
   */
  Future putBucketLogging(params, callback) => new Future.immediate(null);
 
  /**
   * Calls the PutBucketNotification API operation.
   * 
   * See also [Amazon S3 Documentation for PutBucketNotification]()
   */
  Future putBucketNotification(params, callback) => new Future.immediate(null);
  
  /**
   * Calls the PutBucketPolicy API operation.
   * 
   * See also [Amazon S3 Documentation for PutBucketPolicy]()
   */
  Future putBucketPolicy(params, callback) => new Future.immediate(null);

  /**
   * Calls the PutBucketRequestPayment API operation.
   * 
   * See also [Amazon S3 Documentation for PutBucketRequestPayment]()
   */
  Future putBucketRequestPayment(params, callback) => new Future.immediate(null);
  
  /**
   * Calls the PutBucketTagging API operation.
   * 
   * See also [Amazon S3 Documentation for PutBucketTagging]()
   */
  Future putBucketTagging(params, callback) => new Future.immediate(null);
  
  /**
   * Calls the PutBucketVersioning API operation.
   * 
   * See also [Amazon S3 Documentation for PutBucketVersioning]()
   */
  Future putBucketVersioning(params, callback) => new Future.immediate(null);
  
  /**
   * Calls the PutBucketWebsite API operation.
   * 
   * See also [Amazon S3 Documentation for PutBucketWebsite]()
   */
  Future putBucketWebsite(params, callback) => new Future.immediate(null);
  
  /**
   * Calls the PutObject API operation.
   * 
   * See also [Amazon S3 Documentation for PutObject]()
   */
  Future<PutObjectResponse> putObject(String bucketName, String key, Stream data, [ObjectMetadata metadata = null]) => new Future.immediate(null);
  
  /**
   * Calls the PutObjectAcl API operation.
   * 
   * See also [Amazon S3 Documentation for PutObjectAcl]()
   */
  Future putObjectAcl(params, callback) => new Future.immediate(null);
  
  /**
   * Calls the RestoreObject API operation.
   * 
   * See also [Amazon S3 Documentation for RestoreObject]()
   */
  Future restoreObject(params, callback) => new Future.immediate(null);
  
  /**
   *  Calls the UploadPart API operation.
   *  
   *  See also [Amazon S3 Documentation for UploadPart]()
   */
  Future uploadPart(params, callback) => new Future.immediate(null);
  
  /**
   * Calls the UploadPartCopy API operation.
   * 
   * See also [Amazon S3 Documentation for UploadPartCopy]()
   */
  Future uploadPartCopy(params, callback) => new Future.immediate(null);
  
  final AwsRpcClient _rpcClient;
}
