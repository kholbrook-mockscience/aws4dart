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

