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
    var owner = convertElement("Owner", elm, (e) => new BucketOwner.fromXml(e));
    /*
     *  var o = new BucketOwner.fromXml(_getElement("Owner", parsed));
    var b = [ new Bucket.fromXml(_getElement("Owner", parsed)) ];
    var accessKey = _getTag("AccessKeyId", parsed);
    var expire = DateTime.parse(_getTag("Expiration", parsed));
    var secretKey = _getTag("SecretAccessKey", parsed);
    var session = _getTag("SessionToken", parsed);
    */
    return new BucketsResult(null, owner);
  }
  
  BucketsResult(this.buckets, this.owner);
  
  final List<Bucket> buckets;
  final BucketOwner owner;
}

class Bucket {
  factory Bucket.fromXml(XmlElement dom) {
    
  }
  
  Bucket(this.name, this.creationDate);
  
  final String name;
  final DateTime creationDate;
}

class BucketOwner {
  factory BucketOwner.fromXml(XmlElement elm) {
    var id = getString("ID", elm);
    var displayName = getString("DisplayName", elm);
    return new BucketOwner(id, displayName);
  }
  
  BucketOwner(this.id, this.displayName);
  
  final String id, displayName;
}

