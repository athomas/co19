// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion E removeAt(int index)
/// Removes the element at position index from the list.
/// ...
/// Throws an UnsupportedError, and doesn't remove the element, if this is a
/// fixed-length list. In that case the list is not modified.
/// @description Checks that [UnsupportedError] is thrown since [Float64List] is
/// a fixed-length list.
/// @author msyabro


import "dart:typed_data";
import "../../../Utils/expect.dart";

check(List<double> list) {
  var l = new Float64List.fromList(list);
  var length = l.length;
  Expect.throws(() {
    l.removeAt(0);
  }, (e) => e is UnsupportedError);
  Expect.equals(length, l.length);
}

main() {
  check([]);
  check([1.0]);
  check([1.0, 2.0, 3.0, 4.0, 5.0]);
}
