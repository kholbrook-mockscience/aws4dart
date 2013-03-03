// Copyright (c) 2013 Solvr, Inc. All rights reserved.
//
// This open source software is governed by the license terms
// specified in the LICENSE file

part of aws4dart;

/**
 * Amazon S3 client
 */
class S3Client {
  factory S3Client(Injector injector) {
    var rpcClient = injector.getInstance(AwsRpcClient);
    return new S3Client._internal(rpcClient);
  }
  
  S3Client._internal(this._rpcClient);
  
  /*
   * TODO
   * 1. http://docs.amazonwebservices.com/AmazonS3/latest/API/APIRest.html
   * 2. http://docs.aws.amazon.com/AmazonS3/latest/API/APIRest.html
   */
  
  /**
   * Calls the ListBuckets API operation.
   * 
   * See also [Amazon S3 Documentation for ListBuckets](http://docs.amazonwebservices.com/AmazonS3/latest/API/RESTServiceGET.html)
   */
  Future<BucketsResult> listBuckets() {
    var completer = new Completer<BucketsResult>();
    _rpcClient.getXml(r"/listBuckets").then((String xml) {
      var dom = XML.parse(xml);
      completer.complete(new BucketsResult.fromXml(dom));
    });
    return completer.future;
  }
  
  final AwsRpcClient _rpcClient;
}
