// Copyright (c) 2013, the project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed 
// by a Apache license that can be found in the LICENSE file.

part of aws4dart_s3;

class AbortMultipartUploadResponse {}

class CompleteMultipartUploadResponse {}

class CopyObjectResponse {}

class CreateBucketResponse {}

class CreateMultipartUploadResponse {}

class DeleteBucketResponse {}

class DeleteBucketPolicyResponse {}

class DeleteBucketWebsiteResponse {}

class DeleteObjectsResponse {}

class GenericBucketResponse {}

class ListBucketsResponse {
  ListBucketsResponse(this.buckets, this.owner);
  
  final List<Bucket> buckets;
  final Owner owner;
}

class PutObjectResponse {}

