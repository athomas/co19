// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion String join([String separator = ""])
/// Converts each element to a String and concatenates the strings.
/// Iterates through elements of this iterable, converts each one to a String
/// by calling Object.toString, and then concatenates the strings, with the
/// separator string interleaved between the elements.
/// @description Checks that the returned [String] contains all elements from
/// [this] separated by [separator].
/// @author msyabro
/// @issue 43267


import "dart:typed_data";
import "../../../Utils/expect.dart";

check(List<double> list, String separator, String expectedString) {
  var l = new Float32List.fromList(list);
  var s = l.join(separator);
  Expect.stringEquals(expectedString, s);
}

main() {
  check([], "", "");
  check([], ", ", "");
  check([1.25], ", ", "1.25");
  check([1.25, 2.25, 3.25, 4.25, 5.25, 6.25, 7.25, 8.25, 9.25], "  ",
      "1.25  2.25  3.25  4.25  5.25  6.25  7.25  8.25  9.25");
}
