part of aws4dart_sts;

// Copyright (c) 2012 Solvr, Inc. All rights reserved.
//
// This open source software is governed by the license terms
// specified in the LICENSE file

/**
 * Temporary security credential from AWS Security Token Service API (STS)
 */
class StsCredential implements AwsCredential {
  factory StsCredential.fromXml(String xml) {
    var parsed = XML.parse(xml);

    var accessKey = _getTag("AccessKeyId", parsed);
    var expire = new Date.fromString(_getTag("Expiration", parsed));
    var secretKey = _getTag("SecretAccessKey", parsed);
    var session = _getTag("SessionToken", parsed);

    return new StsCredential._internal(accessKey, expire, secretKey, session);
  }

  StsCredential._internal(this.accessKeyId, this.expiration, this.secretAccessKey, this.sessionToken);

  static String _getTag(String tag, var parsedXml) {
    var result = parsedXml.query(tag);
    Expect.equals(1, result.length);
    return result[0].text;
  }

  final String accessKeyId;
  final Date expiration;
  final String secretAccessKey;
  final String sessionToken;
}

class _StsConfig {
  factory _StsConfig(AwsConfig awsConfig) {
    var hostname = awsConfig.getOrDefault("host", "sts.­amazonaws.­com");
    return new _StsConfig._internal("HmacSHA256", "2011-06-15", 43200, hostname, 2);
  }

  _StsConfig._internal(this.algorithm, this.apiVersion, this.duration, this.host, this.signatureVersion);

  final String algorithm;
  final String apiVersion;
  final int duration;
  final String host;
  final int signatureVersion;
}
