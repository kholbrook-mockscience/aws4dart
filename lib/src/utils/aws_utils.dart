part of aws4dart_utils;

// Copyright (c) 2012 Solvr, Inc. All rights reserved.
//
// This open source software is governed by the license terms
// specified in the LICENSE file

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

class AwsException implements Exception {
  AwsException(this.message, this.errorCode);

  final String message;
  final int errorCode;
}

String toISOString(Date date) => date.toString().replaceFirst(" ", "T");

String toUTCString(Date date) {
  // TODO check the new i18n formatter library
  final days = const {
    "0": "Mon",
    "1": "Tue",
    "2": "Wen",
    "3": "Thu",
    "4": "Fri",
    "5": "Sat",
    "6": "Sun"
  };
  final months = const {
    "1":  "Jan",
    "2":  "Feb",
    "3":  "Mar",
    "4":  "Apr",
    "5":  "May",
    "6":  "Jun",
    "7":  "Jul",
    "8":  "Aug",
    "9":  "Sep",
    "10": "Oct",
    "11": "Nov",
    "12": "Dec"
  };
  String pad(int val) => val < 10 ? "0$val" : "$val";

  // convert to format: Mon, 11 Jun 2012 23:58:29 GMT
  var utc = date.toUtc();
  var res = "${days[utc.weekday.toString()]}, ${utc.day} ${months[utc.month.toString()]} ${utc.year} ${pad(utc.hour)}:${pad(utc.minute)}:${pad(utc.second)} GMT";
  return res;
}

/**
 * querystring.stringify({foo: 'bar'}) = 'foo=bar'
 */
String queryStringify(Map<String,String> query, [String sep="&", String eq="="]) {
  String res = "";
  query.forEach((key,val) {
    res = res.concat("${sep}${key}${eq}${val}");
  });
  return res.substring(sep.length);
}
