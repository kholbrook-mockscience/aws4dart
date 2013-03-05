/*
 * Copyright 2013 Solvr, Inc. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"). You
 * may not use this file except in compliance with the License. A copy of
 * the License is located at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * or in the "license" file accompanying this file. This file is
 * distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
 * ANY KIND, either express or implied. See the License for the specific
 * language governing permissions and limitations under the License.
 */

part of aws4dart_s3;

class AbortMultipartUploadResponse {}

class CompleteMultipartUploadResponse {}

class CopyObjectResponse {}

class CreateBucketResponse {}

class DeleteBucketResponse {}

class DeleteBucketPolicyResponse {}

class DeleteBucketWebsiteResponse {}

class DeleteObjectsResponse {}

class GenericBucketResponse {}

class InitiateMultipartUploadResponse {}

class ListBucketsResponse {
  factory ListBucketsResponse._fromXml(XmlElement elm) {
    var owner = convertXmlElement("Owner", elm, (e) => new Owner._fromXml(e));
    var buckets = convertXmlElementList("Bucket", elm, (e) => new Bucket._fromXml(e));
    return new ListBucketsResponse(buckets, owner);
  }
  
  ListBucketsResponse(this.buckets, this.owner);
  
  final List<Bucket> buckets;
  final Owner owner;
}

class PutObjectResponse {}

