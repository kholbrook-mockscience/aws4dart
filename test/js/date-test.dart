// Copyright (c) 2013 Solvr, Inc. All rights reserved.
//
// This open source software is governed by the license terms
// specified in the LICENSE file

main() {
  var date1 = new DateTime.now().toString().replaceFirst(" ", "T");
  print(date1);

  var date2 = new DateTime.now().toUtc().toString();
  print(date2);
  
  var date3 = new DateTime.now().toUtc().toString().replaceFirst(" ", "T");
  print(date3);
}
