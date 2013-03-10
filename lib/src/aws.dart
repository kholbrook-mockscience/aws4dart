/*
 * Copyright 2013 Solvr, Inc. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"). You
 * may not use this file except in compliance with the License. A copy of
 * the License is located at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * or in the "license" file accompanying this file. This file is
 * distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
 * ANY KIND, either express or implied. See the License for the specific
 * language governing permissions and limitations under the License.
 */

part of aws4dart;

/**
 * TODO describe
 */
class AwsClient {
  factory AwsClient(Module module) {
    var injector = new Injector(module);
    return new AwsClient._internal(injector);
  }
  
  AwsClient._internal(Injector injector): 
    config = new AwsConfig(),
    dynamodb = new DynamodbClient(injector),
    s3 = new S3Client(injector);
  
  final DynamodbClient dynamodb;
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
   * Load configuration from JSON file located in [configPath]
   */
  loadFromPath(String configPath) {
    var configFile = new File(configPath);
    if(!configFile.existsSync()) {
      throw new ArgumentError("no config file exists at path $configPath");
    }
    _logger.debug("using config file ${configFile.fullPathSync()}");
    _loadFromJson(configFile.readAsStringSync());
  }
  
  /**
   * Load configuration by resolving path of configuration file from environment variable [configPathEnv] 
   */
  loadFromEnv(String configPathEnv) {
    var env = Platform.environment;
    if(!env.containsKey(configPathEnv)) {
      throw new ArgumentError("no environment variable named $configPathEnv exists");
    }
    var configPath = env[configPathEnv];
    loadFromPath(configPath);
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

class _AwsModule extends Module {
  @override 
  configure() {
    bind(AwsRpcClient).toInstance(new AwsRpcClient());
  }
}






