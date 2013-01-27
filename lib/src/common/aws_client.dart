// Copyright (c) 2013 Solvr, Inc. All rights reserved.
//
// This open source software is governed by the license terms
// specified in the LICENSE file

library aws4dart_client;

import "dart:io";
import "dart:json" as JSON;
import "package:log4dart/log4dart.dart";

/**
 * Configuration values for Amazon Web Services
 */
class AwsConfig implements AwsCredential {
  factory AwsConfig.fromJsonFile([String configPath = "aws-config.json"]) {
    var configFile = new File(configPath);
    _logger.debug("using config file ${configFile.fullPathSync()}");
    Expect.isTrue(configFile.existsSync());
    return new AwsConfig.fromJson(configFile.readAsTextSync());
  }

  factory AwsConfig.fromJson(String json) {
    return new AwsConfig._internal(JSON.parse(json));
  }

  factory AwsConfig.auth(String authKey, String authSecret) {
    var props = {
       "accessKeyId": authKey,
       "secretAccessKey": authSecret
    };
    return new AwsConfig._internal(props);
  }

  AwsConfig._internal(this._properties) {
    Expect.isNotNull(accessKeyId, "no accessKeyId specified");
    Expect.isNotNull(secretAccessKey, "no secretAccessKey specified");
  }

  /**
   * True if configuration value exists
   */
  bool hasValue(String configName) => _properties.containsKey(configName);

  /**
   * Get configuration value
   */
  operator [](String configName) => _properties[configName];

  /**
   * Get configuration value if it exists else return default value
   */
  String getOrDefault(String configName, String defaultValue) {
    if(hasValue(configName)) {
      return this[configName];
    }
    _logger.warn("no configuration value found for $configName, using default value $defaultValue");
    return defaultValue;
  }

  String get accessKeyId => this["accessKeyId"];

  String get secretAccessKey => this["secretAccessKey"];

  static Logger get _logger => LoggerFactory.getLogger("aws4dart.AWSConfig");
  final Map<String,String> _properties;
}

/**
 * Base class for constructing Amazon web service clients
 */
class AwsClient {
  AwsClient(this.config)
    : httpClient = new HttpClient();

  final HttpClient httpClient;
  final AwsConfig config;
}

/**
 * Auth key and secret used for connecting to Amazon
 */
abstract class AwsCredential {
  String get accessKeyId;

  String get secretAccessKey;
}

/**
 * TODO describe
 */
class Header {
  Header(this.type, String headerValue) {
    value = headerValue;
    Expect.isTrue(type.isValid);
  }

  String get name => type.name;

  String get value => _value;

  set value(String val) => _value = val.trim();

  final HeaderType type;
  String _value;
}

/**
 * TODO describe
 */
class HeaderType {
  const HeaderType(this.name, [ this.isAwsHeader = false ]);

  static final HOST = const HeaderType("host");
  static final AWS_AUTHORIZATION = const HeaderType("x-amzn-authorization", true);
  static final AWS_DATE = const HeaderType("x-amz-date", true);
  static final AWS_SECURITY_TOKEN = const HeaderType("x-amz-security-token", true);
  static final AWS_TARGET = const HeaderType("x-amz-target", true);
  static final CONTENT_TYPE = const HeaderType("content-type");

  // header names must be lower case and contain no trailing whitespace
  bool get isValid => (name.trim().toLowerCase() == name);

  int get hashCode => name.hashCode;

  final String name;
  final bool isAwsHeader;
}

/**
 * TODO describe
 */
class AwsException implements Exception {
  AwsException(this.message, this.errorCode);

  final String message;
  final int errorCode;
}
