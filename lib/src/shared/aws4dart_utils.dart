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

/**
 * Common internal functionality used accross clients (not! exported to end users).
 */
library aws4dart_utils;

import 'package:xml/xml.dart';

String toISOString(DateTime date) => date.toString().replaceFirst(" ", "T");

String toUTCString(DateTime date) {
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

  // convert to format: Mon, 11 Jun 2013 23:58:29 GMT
  var utc = date.toUtc();
  var res = "${days['${utc.weekday}']}, ${utc.day} ${months[utc.month.toString()]} ${utc.year} ${pad(utc.hour)}:${pad(utc.minute)}:${pad(utc.second)} GMT";
  return res;
}

/**
 * Turn map into a query string using the specified [separator] and [equal] symbol.
 * 
 * queryStringify({foo: 'bar'}) = 'foo=bar'
 */
String queryStringify(Map<String,String> query, {String separator:"&", String equal:"="}) {
  String res = "";
  query.forEach((key,val) {
    res = res.concat("${separator}${key}${equal}${val}");
  });
  return res.substring(separator.length);
}

/**
 * TODO describe
 */
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

String getXmlAsString(String name, XmlElement elm) => convertXmlElement(name, elm, (XmlElement elm) => elm.text);

DateTime getXmlAsDate(String name, XmlElement elm) => DateTime.parse(getXmlAsString(name, elm));

Object convertXmlElement(String name, XmlElement elm, Object converter(XmlElement xml)) {
  var result = elm.query(name);
  assert(result.length == 1);
  return converter(result[0]);
}

List<Object> convertXmlElementList(String name, XmlElement elm, Object converter(XmlElement xml)) {
  var result = elm.queryAll(name);
  var converted = result.map(converter);
  return new List.from(converted);
}
