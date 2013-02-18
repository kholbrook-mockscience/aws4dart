// Copyright (c) 2013 Solvr, Inc. All rights reserved.
//
// This open source software is governed by the license terms
// specified in the LICENSE file

library aws4dart_utils;

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
