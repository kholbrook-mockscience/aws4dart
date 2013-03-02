// Copyright (c) 2013 Solvr, Inc. All rights reserved.
//
// This open source software is governed by the license terms
// specified in the LICENSE file

part of aws4dart;

/**
 * List of all buckets owned by the authenticated user
 */
class BucketsResult {
  BucketsResult(this.buckets, this.owner);
  
  final List<Bucket> buckets;
  final BucketOwner owner;
}

class Bucket {
  Bucket(this.name, this.creationDate);
  
  final String name;
  final DateTime creationDate;
}

class BucketOwner {
  BucketOwner(this.id, this.displayName);
  
  final String id, displayName;
}

