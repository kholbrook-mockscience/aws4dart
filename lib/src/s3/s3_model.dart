// Copyright (c) 2013, the project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed 
// by a Apache license that can be found in the LICENSE file.

part of aws4dart_s3;

/**
 * Represents an Amazon S3 bucket.
 */
class Bucket {
  // https://github.com/aws/aws-sdk-java/blob/master/src/main/java/com/amazonaws/services/s3/model/Bucket.java
  
  factory Bucket._fromXml(XmlElement elm) {
    var name = getXmlAsString("Name", elm);
    var creationDate = getXmlAsDate("CreationDate", elm);
    return new Bucket._internal(name,creationDate);
  }
  
  Bucket._internal(this.name, this._creationDate);
  
  Bucket(this.name);
  
  DateTime get creationDate => _creationDate;
  
  final String name;
  DateTime _creationDate;
}

class ObjectMetadata {}

/**
 * Represents the owner of an Amazon S3 bucket.
 */
class Owner {
  // https://github.com/aws/aws-sdk-java/blob/master/src/main/java/com/amazonaws/services/s3/model/Owner.java
  
  factory Owner._fromXml(XmlElement elm) {
    var id = getXmlAsString("ID", elm);
    var displayName = getXmlAsString("DisplayName", elm);
    return new Owner(id, displayName);
  }
  
  Owner(this.id, this.displayName);
  
  final String id, displayName;
}

