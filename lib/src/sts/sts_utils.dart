// Copyright (c) 2013 Solvr, Inc. All rights reserved.
//
// This open source software is governed by the license terms
// specified in the LICENSE file

part of aws4dart_sts;

/**
 * Temporary security credential from AWS Security Token Service API (STS)
 */
class StsCredential implements AwsCredential {
  factory StsCredential.fromXml(String xml) {
    var parsed = XML.parse(xml);

    var accessKey = _getTag("AccessKeyId", parsed);
    var expire = DateTime.parse(_getTag("Expiration", parsed));
    var secretKey = _getTag("SecretAccessKey", parsed);
    var session = _getTag("SessionToken", parsed);

    return new StsCredential._internal(accessKey, expire, secretKey, session);
  }

  StsCredential._internal(this.accessKeyId, this.expiration, this.secretAccessKey, this.sessionToken);

  static String _getTag(String tag, var parsedXml) {
    var result = parsedXml.query(tag);
    assert(result.length == 1);
    return result[0].text;
  }

  final String accessKeyId, secretAccessKey, sessionToken;
  final DateTime expiration;
}

class _StsConfig {
  factory _StsConfig(AwsConfig awsConfig) {
    var hostname = awsConfig.getOrDefault("host", "sts.­amazonaws.­com");
    return new _StsConfig._internal("HmacSHA256", "2011-06-15", 43200, hostname, 2);
  }

  _StsConfig._internal(this.algorithm, this.apiVersion, this.duration, this.host, this.signatureVersion);

  final String algorithm, apiVersion, host;
  final int duration, signatureVersion;
}
