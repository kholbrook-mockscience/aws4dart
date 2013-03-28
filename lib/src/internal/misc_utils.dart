// Copyright (c) 2013, the project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed 
// by a Apache license that can be found in the LICENSE file.

part of aws4dart_internal;

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
    res = "${res}${separator}${key}${equal}${val}";
  });
  return res.substring(separator.length);
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





