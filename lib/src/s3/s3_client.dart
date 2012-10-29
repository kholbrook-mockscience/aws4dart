part of aws4dart:s3;

// Copyright (c) 2012 Solvr, Inc. All rights reserved.
//
// This open source software is governed by the license terms
// specified in the LICENSE file

/**
 * Client for Amazon S3 API
 *
 * See http://docs.amazonwebservices.com/AmazonS3/latest/API/APIRest.html
 *
 * TODO http://docs.amazonwebservices.com/AmazonS3/latest/dev/RESTAuthentication.html
 * Inspired by https://github.com/LearnBoost/knox
 */
class S3Client extends AwsClient {
  S3Client(AwsConfig config): super(config);

  Future<HttpClientResponse> _request(String method, String filename, Map headers) {
    var completer = new Completer<HttpClientResponse>();
    var time = new Date.now();
    var endpoint = config["s3Endpoint"];
    var bucket = config["s3Bucket"];

    // default headers
    /*
    this.merge(headers, {
      "Date": time.toUTCString(),
      "Host": endpoint
    });
    */

    // authorization header
    /*
    headers["Authorization"] = authorization(
      verb: method,
      resource: canonicalizeResource("$bucket/$filename"),
      contentType: headers['Content-Type'],
      md5: headers['Content-MD5'],
      date: time,
      amazonHeaders: canonicalizeHeaders(headers)
    );
     */

    // issue request
    /*
    Uri uri = new Uri.fromString("$endpoint/$bucket/$filename");
    HttpClientConnection conn = httpClient.openUrl(method, uri);
    conn.onRequest = (HttpClientRequest request) => headers.forEach((name,value) => request.setHeader(name, value));
    conn.onResponse = (HttpClientResponse response) => completer.complete(response);
    conn.onError = (e) => completer.completeException(e);
     */

    return completer.future;
  }

  /**
   * Perform the following:
   *
   *  - ignore non sub-resources
   *  - sort lexicographically
   */

  String canonicalizeResource(String resource) {
    /*
    var url = parse(resource, true)
    , path = url.pathname
    , buf = [];

    Object.keys(url.query).forEach(function(key){
      if (!~keys.indexOf(key)) return;
      var val = '' == url.query[key] ? '' : '=' + encodeURIComponent(url.query[key]);
      buf.push(key + val);
    });

    return path + (buf.length
      ? '?' + buf.sort().join('&')
      : '');
    */
  }

  /**
   * Perform the following:
   *
   *  - ignore non-amazon headers
   *  - lowercase fields
   *  - sort lexicographically
   *  - trim whitespace between ":"
   *  - join with newline
   */
  String canonicalizeHeaders(headers) {
    /*
    var buf = [], fields = Object.keys(headers);
    for (var i = 0, len = fields.length; i < len; ++i) {
      var field = fields[i]
        , val = headers[field]
        , field = field.toLowerCase();
      if (0 !== field.indexOf('x-amz')) continue;
      buf.push(field + ':' + val);
    }
    return buf.sort().join('\n');
      */
  }


  /**
   * Get file as String
   */
  Future<String> getFile(String filename, [Map headers = const {}]) {
    var completer = new Completer<String>();

    getFileRaw(filename, headers).then((HttpClientResponse response) {
      StringInputStream stream = new StringInputStream(response.inputStream);
      StringBuffer body = new StringBuffer();
      stream.onData = () => body.add(stream.read());
      stream.onClosed = () => completer.complete(body.toString());
    });

    return completer.future;
  }

  /**
   * Get file as raw HTTP response
   */
  Future<HttpClientResponse> getFileRaw(String filename, [Map headers = const {}]) {
    return _request("GET", filename, headers);
  }

  /**
   * Upload file content to URL
   *
   * File content can be either a string or a file
   */
  putFile(String url, var fileContent, [Map headers = const {}]) {
    /*
    HttpClientConnection conn = httpClient.post("127.0.0.1", port, "/leave");
    conn.onRequest = (HttpClientRequest request) {
      request.outputStream.writeString(asString(fileContent));
      request.outputStream.close();
    };
    conn.onResponse = (HttpClientResponse response) {
      StringInputStream stream = new StringInputStream(response.inputStream);
      StringBuffer body = new StringBuffer();
      stream.onData = () => body.add(stream.read());
      stream.onClosed = () {
        leaveResponseHandler(response, body.toString());
      };
    };
    */
  }

  /**
   * Delete file
   */
  deleteFile(String url, [Map headers = const {}]) {

  }
}
