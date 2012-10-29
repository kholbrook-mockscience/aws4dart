part of aws4dart:utils;

// Copyright (c) 2012 Solvr, Inc. All rights reserved.
//
// This open source software is governed by the license terms
// specified in the LICENSE file

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
