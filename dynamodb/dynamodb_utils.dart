// Copyright (c) 2012 Solvr, Inc. All rights reserved.
//
// This open source software is governed by the license terms 
// specified in the LICENSE file

/*
 * Helper class for making DynamoDB requests
 *
 * Inspired by https://raw.github.com/Wantworthy/dynode/master/lib/dynode/request.js
 */
class _DynamoDbRequester {
  _DynamoDbRequester(AwsConfig config)
    : _stsClient = new StsClient(config),
      _signer = new _Signer(),
      _defaults = new _DynamoDbConfig(config);
  
  Future<Map> send(String action, Map messageBody, HttpClient httpClient) {
    var completer = new Completer<String>();
    Future<StsCredential> sessionFuture = _stsClient.getSessionToken(); 
    sessionFuture.handleException((e) => completer.completeException(e));
    
    sessionFuture.then((StsCredential credentials) {
      var headers = new List<Header>();
      headers.add(new Header(HeaderType.HOST, _defaults.host));
      headers.add(new Header(HeaderType.AWS_DATE, toUTCString(new Date.now())));
      headers.add(new Header(HeaderType.AWS_SECURITY_TOKEN, credentials.sessionToken));
      headers.add(new Header(HeaderType.AWS_TARGET, _defaults.apiVersion.concat(action)));
      headers.add(new Header(HeaderType.CONTENT_TYPE, "application/x-amz-json-1.0"));

      var signedHeaders = _signer.sign(headers, messageBody, credentials as AwsCredential);
      var host = _defaults.host;
      var port = 80;
      
      // Make request
      var conn = httpClient.post(host, port, "");
      conn.onRequest = (HttpClientRequest request) {
        signedHeaders.forEach((Header header) => request.headers.add(header.name, header.value));
        request.outputStream.writeString(JSON.stringify(messageBody));
        request.outputStream.close();
      };
      // Handle response
      conn.onResponse = (HttpClientResponse response) {
        if(response.statusCode != 200) {
          completer.completeException(new AwsException("DynamoDB faild with", response.statusCode));
        } else {
          StringInputStream stream = new StringInputStream(response.inputStream);
          StringBuffer body = new StringBuffer();
          stream.onData = () => body.add(stream.read());
          stream.onClosed = () {
            var json = JSON.parse(body.toString());
            completer.complete(json);
          };
        }
      };
      conn.onError = (e) => completer.completeException(e);
    });
    
    return completer.future;
  }
  
  final StsClient _stsClient;
  final _Signer _signer;
  final _DynamoDbConfig _defaults;
}

class _DynamoDbConfig {
  factory _DynamoDbConfig(AwsConfig awsConfig) {
    var hostname = awsConfig.getOrDefault("host", "dynamodb.us-east-1.amazonaws.com");
    return new _DynamoDbConfig._internal("DynamoDB_20111205.", hostname);
  }
  
  _DynamoDbConfig._internal(this.apiVersion, this.host);
  
  final String apiVersion;
  final String host;
}

