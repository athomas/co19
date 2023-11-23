// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool remove(Object value)
/// Removes the first occurrence of value from this list.
/// ...
/// An UnsupportedError occurs if the list is fixed-length.
/// @description Checks that an UnsupportedError is thrown as Int32x4List is
/// fixed-length.
/// @author ngl@unipro.ru


import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

main() {
  var list = [i32x4(0), i32x4(1), i32x4(2), i32x4(3)];

  var l = new Int32x4List.fromList(list);
  Expect.throws(() { l.remove(i32x4(6)); }, (e) => e is UnsupportedError);
  Expect.equals(list.length, l.length);

  Expect.throws(() { l.remove(i32x4(2)); }, (e) => e is UnsupportedError);
  Expect.equals(list.length, l.length);

  l = new Int32x4List(0);
  Expect.throws(() { l.remove(i32x4(6)); }, (e) => e is UnsupportedError);
  Expect.equals(0, l.length);
}
