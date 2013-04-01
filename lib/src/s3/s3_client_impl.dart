// Copyright (c) 2013, the project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed 
// by a Apache license that can be found in the LICENSE file.

part of aws4dart_s3;

class _S3ClientImpl implements S3Client {
  // http://docs.aws.amazon.com/AWSJavaScriptSDK/latest/AWS/S3/Client.html
  // https://github.com/aws/aws-sdk-java/blob/master/src/main/java/com/amazonaws/services/s3/AmazonS3Client.java
  _S3ClientImpl(this._rpcClient);
  
  @override
  Future<List<Bucket>> listBuckets() {
    var completer = new Completer<List<Bucket>>();
    var request = new ListBucketsRequest();
    _rpcClient.getXml(request).then((String xml) {
      var dom = XML.parse(xml);
      ListBucketsResponse response = mapListBucketsResponse(dom);
      completer.complete(response.buckets);
    });
    return completer.future;
  }
  
  final AwsRpcClient _rpcClient;
}

