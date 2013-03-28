// Copyright (c) 2013, the project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed 
// by a Apache license that can be found in the LICENSE file.

part of aws4dart_internal;

abstract class AwsHttpClient {
  Uri endpoint;
}

class AwsCredentials { }

class HttpMethod {
  static const GET = const HttpMethod("GET");
  
  const HttpMethod(this.type);
  
  final String type;
}

class Header {
  Header(this.type, String headerValue) {
    value = headerValue;
    assert(type.isValid);
  }

  String get name => type.name;

  String get value => _value;

  set value(String val) => _value = val.trim();

  final HeaderType type;
  String _value;
}

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
