// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void addAll(Iterable<E> iterable)
/// Appends all objects of iterable to the end of this list.
/// Extends the length of the list by the number of objects in iterable. Throws
/// an [UnsupportedError] if this list is fixed-length.
/// @description Checks that [UnsupportedError] is thrown since [Float32x4List]
/// is a fixed-size list.
/// @author msyabro


import "dart:typed_data";
import "../../../Utils/expect.dart";

check(length) {
  var l = new Float32x4List(length);
  Expect.throws(() { l.addAll([]); }, (e) => e is UnsupportedError);
  Expect.equals(length, l.length);
}

main() {
  check(0);
  check(1);
  check(100);
  check(2048);
}
