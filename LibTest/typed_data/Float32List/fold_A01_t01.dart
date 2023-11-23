// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion T fold(T initialValue, T combine(T previousValue, E element))
/// Reduces a collection to a single value by iteratively combining each element
/// of the collection with an existing value using the provided function.
/// Uses initialValue as the initial value, then iterates through the elements
/// and updates the value with each element using the combine function.
/// @description Checks that the returned value is correct.
/// @author msyabro


import "dart:typed_data";
import "../../../Utils/expect.dart";

checkDouble(List<double> list, double expected) {
  var l = new Float32List.fromList(list);
  var res = l.fold(0.0, (double prev, double cur) => prev + cur);
  Expect.equals(expected, res);
}

checkInt(List<double> list, int expected) {
  var l = new Float32List.fromList(list);
  var res = l.fold(0, (num prev, double cur) => prev + cur);
  Expect.equals(expected, res);
}

checkString(List<double> list, String expected) {
  var l = new Float32List.fromList(list);
  var res = l.fold("", (prev, cur) => "${prev}${cur}");
  Expect.equals(expected, res);
}

checkConst(List<double> list, int expected) {
  var l = new Float32List.fromList(list);
  var res = l.fold(0, (prev, cur) => 1);
  Expect.equals(expected, res);
}


main() {
  checkDouble([], 0.0);
  checkDouble([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0], 55.0);
  checkDouble([10.0, -1.0, -2.0, -3.0, -4.0], 0.0);

  checkInt([], 0);
  checkInt([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0], 55);
  checkInt([10.0, -1.0, -2.0, -3.0, -4.0], 0);

  checkString([], "");

  checkConst([], 0);
  checkConst([1.0, 2.0, 3.0], 1);
}
