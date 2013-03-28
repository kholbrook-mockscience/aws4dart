// Copyright (c) 2013, the project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed 
// by a Apache license that can be found in the LICENSE file.

part of aws4dart_api;

/** Client settings for accessing Amazon Web Services */
class AwsConfig {
  /** Load configuration from JSON file located in [configPath] */
  loadFromPath(String configPath) {
    var configFile = new File(configPath);
    if(!configFile.existsSync()) {
      throw new ArgumentError("no config file exists at path $configPath");
    }
    _logger.debug("using config file ${configFile.fullPathSync()}");
    _loadFromJson(configFile.readAsStringSync());
  }
  
  /** Load configuration by resolving path of configuration file from environment variable [configPathEnv] */
  loadFromEnv(String configPathEnv) {
    var env = Platform.environment;
    if(!env.containsKey(configPathEnv)) {
      throw new ArgumentError("no environment variable named $configPathEnv exists");
    }
    var configPath = env[configPathEnv];
    loadFromPath(configPath);
  }

  /** Use new JSON values passed in [config] as configuration properties */
  update(String config) => _loadFromJson(config);
  
  _loadFromJson(String json) {
    var cfg = JSON.parse(json);
  }

  /** True if configuration value exists */
  bool containsKey(String configName) => _properties.containsKey(configName);

  /** Get configuration value */
  operator [](String configName) => _properties[configName];

  /** Get configuration value if it exists else return default value */
  String getOrDefault(String configName, String defaultValue) {
    if(containsKey(configName)) {
      return this[configName];
    }
    _logger.warn("no configuration value found for $configName, using default value $defaultValue");
    return defaultValue;
  }

  String get accessKeyId => this["accessKeyId"];

  String get secretAccessKey => this["secretAccessKey"];

  final Logger _logger = LoggerFactory.getLoggerFor(AwsConfig);
  final _properties = new Map<String,String>();
}

/** Client for making HTTP requests against Amazon's web services */
class AwsRpcClient {
  Future<String> getXml(AwsRequest request) {
    var completer = new Completer<String>();
    String url = "TODO";
    get(url).then((Response response) {
      if(response.statusCode != 200) {
        completer.completeError(new AwsError("request with", response.statusCode));
      } else {
        completer.complete(response.body);
      }
    });
    
    return completer.future;
  }
}

class AwsError implements Error {
  AwsError(this.errorMessage, this.errorCode);
  
  final String errorMessage;
  final int errorCode;
}

/** Base class for all Amazon web-service requests */
abstract class AwsRequest { }





