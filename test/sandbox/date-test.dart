// Copyright (c) 2012 Solvr, Inc. All rights reserved.
//
// This open source software is governed by the license terms
// specified in the LICENSE file

main() {
  var date = new Date.now();
  var res = date.toString().replaceFirst(" ", "T");
  print(res);

  var date2 = new Date.now().toUtc().toString();
  print(date2);
}
