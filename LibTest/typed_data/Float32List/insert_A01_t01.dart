// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void insert(int index, E value)
/// Inserts the object at position [index] in the list.
/// This increases the length of the list by one and shifts all objects at or
/// after the [index] towards the end of the list.
/// An error occurs if the index is less than 0 or greater than length. An
/// UnsupportedError occurs if the list is fixed-length.
/// @description Checks that [UnsupportedError] is thrown since [Float32List] is
/// a fixed-size list.
/// @author msyabro


import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Float32List(10);
  Expect.throws(() { l.insert(0, 0.0); }, (e) => e is UnsupportedError);
  Expect.equals(10, l.length);

  l = new Float32List(0);
  Expect.throws(() { l.insert(0, 0.0); }, (e) => e is UnsupportedError);
  Expect.equals(0, l.length);
}
