// Copyright (c) 2013, the project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed 
// by a Apache license that can be found in the LICENSE file.

part of aws4dart_s3;

ListBucketsResponse mapListBucketsResponse(XmlElement elm) {
  var owner = convertXmlElement("Owner", elm, _mapOwner);
  var buckets = convertXmlElementList("Bucket", elm, _mapBucket);
  return new ListBucketsResponse(buckets, owner);
}

Bucket _mapBucket(XmlElement elm) {
  var name = getXmlAsString("Name", elm);
  var creationDate = getXmlAsDate("CreationDate", elm);
  return new Bucket.init(name,creationDate);
}

Owner _mapOwner(XmlElement elm) {
  var id = getXmlAsString("ID", elm);
  var displayName = getXmlAsString("DisplayName", elm);
  return new Owner(id, displayName);
}


