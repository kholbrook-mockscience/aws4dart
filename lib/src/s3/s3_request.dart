// Copyright (c) 2013, the project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed 
// by a Apache license that can be found in the LICENSE file.

part of aws4dart_s3;

class AbortMultipartUploadRequest extends AwsRequest {}

class CompleteMultipartUploadRequest extends AwsRequest {}

class CopyObjectRequest extends AwsRequest {}

class CreateBucketRequest extends AwsRequest {}

class CreateMultipartUploadRequest extends AwsRequest {}

class DeleteBucketRequest extends AwsRequest {}

class DeleteBucketPolicyRequest extends AwsRequest {}

class DeleteBucketWebsiteRequest extends AwsRequest {}

class DeleteObjectsRequest extends AwsRequest {}

class GenericBucketRequest extends AwsRequest {}

class ListBucketsRequest extends AwsRequest {
  /*
  ListBucketsRequest()
  final method = HttpMethod.GET;
  
  private void ConvertListBuckets(ListBucketsRequest request)
  {
    Map parameters = request.parameters;

    parameters[S3QueryParameter.Verb] = S3Constants.GetVerb;
    parameters[S3QueryParameter.Action] = "ListBuckets";
    request.RequestDestinationBucket = null;
  }
  */
}

class PutObjectRequest extends AwsRequest {} 
