// Copyright (c) 2012 Solvr, Inc. All rights reserved.
//
// This open source software is governed by the license terms 
// specified in the LICENSE file

class _StsClientImpl extends AwsClient implements StsClient {
  _StsClientImpl(AwsConfig awsConfig)
    : _defaults = new _StsConfig(awsConfig),
      super(awsConfig);
  
  StsCredential get credentials {
    if(_credentials !== null && _credentials.expiration > new Date.now()) {
      return _credentials;
    } else {
      return null;
    }
  }
  
  Future<StsCredential> getSessionToken() {
    var completer = new Completer<StsCredential>();
    
    if(credentials !== null) {
      completer.complete(credentials);
    } else {
      var path = "/?${queryStringify(_buildParams())}";
      var host = _defaults.host;
      var port = 80;
      
      var conn = httpClient.get(host, port, path);
      conn.onResponse = (HttpClientResponse response) {
        if(response.statusCode != 200) {
          completer.completeException(new AwsException("STS faild with", response.statusCode));
        } else {
          StringInputStream stream = new StringInputStream(response.inputStream);
          StringBuffer body = new StringBuffer();
          stream.onData = () => body.add(stream.read());
          stream.onClosed = () {
            _credentials = new StsCredential.fromXml(body.toString());
            completer.complete(credentials);
          };
        }
      };
      conn.onError = (e) => completer.completeException(e);
    }
    
    return completer.future;
  }
  
  Map<String,String> _buildParams() {
    var params = ({
      "AWSAccessKeyId" : config.accessKeyId,
      "Action" : "GetSessionToken",
      "DurationSeconds" : _defaults.duration,
      "SignatureMethod" : _defaults.algorithm,
      "SignatureVersion" : _defaults.signatureVersion,
      "Timestamp" : toISOString(new Date.now()),
      "Version" : _defaults.apiVersion
    } as Map<String,String>);

    var toSign = Strings.join(["GET", _defaults.host, "/", queryStringify(params)], "\n");
    
    var hmac = new HMAC(new SHA256(), config.secretAccessKey.charCodes());
    var hmacDigest = hmac.update(toSign.charCodes()).digest();
    var signature = CryptoUtils.bytesToBase64(hmacDigest);
    
    params["Signature"] = signature;
    return params;
  }
  
  static StsCredential _credentials;
  final _StsConfig _defaults;
}

