// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool remove(Object element)
/// Removes value from the list. Returns true if value was in the list, false
/// otherwise.
/// ...
/// An UnsupportedError occurs if the list is fixed-length.
/// @description Checks that [UnsupportedError] is thrown since [Uint8List] is a
/// fixed-length list.
/// @author msyabro


import "dart:typed_data";
import "../../../Utils/expect.dart";

check(List<int> list, int element) {
  var l = new Uint8List.fromList(list);
  var length = l.length;
  Expect.throws(() { l.remove(element); }, (e) => e is UnsupportedError);
  Expect.equals(length, l.length);
}

main() {
  check([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 1);
  check([0], 0);

  check([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 0);
  check([], 1);
}
