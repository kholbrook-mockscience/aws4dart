// Copyright (c) 2013 Solvr, Inc. All rights reserved.
//
// This open source software is governed by the license terms
// specified in the LICENSE file

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

