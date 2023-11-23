// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void insert(int index, E element)
/// Inserts the object at position index in this list.
/// This increases the length of the list by one and shifts all objects at or
/// after the index towards the end of the list.
/// ...
/// An UnsupportedError occurs if the list is fixed-length.
/// @description Checks that an UnsupportedError occurs as the Float64x2List is
/// fixed-length list.
/// @author ngl@unipro.ru


import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

main() {
  var l = new Float64x2List.fromList(
      [f64x2(1.0), f64x2(2.0), f64x2(3.0), f64x2(4.0), f64x2(5.0), f64x2(6.0)]);
  Expect.throws(() { l.insert(2, f64x2(11.0)); }, (e) => e is UnsupportedError);
  Expect.equals(6, l.length);

  l = new Float64x2List.fromList([]);
  Expect.throws(() { l.insert(0, f64x2(11.0)); }, (e) => e is UnsupportedError);
  Expect.equals(0, l.length);
}
