// Copyright (c) 2013 Solvr, Inc. All rights reserved.
//
// This open source software is governed by the license terms
// specified in the LICENSE file

part of aws4dart;

/**
 * TODO describe
 */
class Aws {
  Aws(): 
    config = new AwsConfig(),
    s3 = new S3Client();
  
  final S3Client s3;
  final AwsConfig config;
}

/**
 * Configuration values for Amazon Web Services
 */
class AwsConfig {
  AwsConfig():
    _logger = LoggerFactory.getLoggerFor(AwsConfig),
    _properties = {};
  
  /**
   * Load configuration from JSON properties stored in file at [configPath]
   */
  loadFromPath(String configPath) {
    var configFile = new File(configPath);
    _logger.debug("using config file ${configFile.fullPathSync()}");
    assert(configFile.existsSync());
    _loadFromJson(configFile.readAsStringSync());
  }

  /**
   * Use new JSON values passed in [config] as configuration properties
   */
  update(String config) => _loadFromJson(config);
  
  _loadFromJson(String json) {
    var cfg = JSON.parse(json);
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

  final Logger _logger;
  final Map<String,String> _properties;
}



