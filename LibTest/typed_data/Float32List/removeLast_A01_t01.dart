// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion E removeLast()
/// Pops and returns the last object in this list.
/// Throws an UnsupportedError if this is a fixed-length list.
/// @description Checks that [UnsupportedError] is thrown since [Float32List] is
/// a fixed-size list.
/// @author msyabro


import "dart:typed_data";
import "../../../Utils/expect.dart";

check(List<double> list) {
  var l = new Float32List.fromList(list);
  var length = l.length;
  Expect.throws(() { l.removeLast(); }, (e) => e is UnsupportedError);
  Expect.equals(length, l.length);
}

main() {
  check([]);
  check([1.0]);
  check([1.0, 2.0, 3.0, 4.0, 5.0]);
}
