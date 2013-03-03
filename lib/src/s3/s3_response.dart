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

part of aws4dart;

/**
 * List of all buckets owned by the authenticated user
 */
class BucketsResult {
  factory BucketsResult.fromXml(XmlElement elm) {
    var owner = convertXmlElement("Owner", elm, (e) => new BucketOwner.fromXml(e));
    var buckets = convertXmlElementList("Bucket", elm, (e) => new Bucket.fromXml(e));
    return new BucketsResult(buckets, owner);
  }
  
  BucketsResult(this.buckets, this.owner);
  
  final List<Bucket> buckets;
  final BucketOwner owner;
}

/**
 * TODO describe
 */
class Bucket {
  factory Bucket.fromXml(XmlElement elm) {
    var name = getXmlAsString("Name", elm);
    var creationDate = getXmlAsDate("CreationDate", elm);
    return new Bucket(name,creationDate);
  }
  
  Bucket(this.name, this.creationDate);
  
  final String name;
  final DateTime creationDate;
}

/**
 * TODO describe
 */
class BucketOwner {
  factory BucketOwner.fromXml(XmlElement elm) {
    var id = getXmlAsString("ID", elm);
    var displayName = getXmlAsString("DisplayName", elm);
    return new BucketOwner(id, displayName);
  }
  
  BucketOwner(this.id, this.displayName);
  
  final String id, displayName;
}

