// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion List<E> toList({bool growable: true})
/// ...
/// The list is fixed-length if growable is false.
/// @description Checks that the returned list is not fixed-length if growable
/// is true.
/// @author ngl@unipro.ru


import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

equal(o1, o2) => o1.x == o2.x && o1.y == o2.y && o1.z == o2.z && o1.w == o2.w;

main() {
  var list = [i32x4(0), i32x4(1), i32x4(2), i32x4(6), i32x4(4), i32x4(5)];
  var l = new Int32x4List.fromList(list);
  var res = l.toList(growable: true);

  Expect.equals(l.length, res.length);

  res.add(i32x4(11));
  Expect.equals(7, res.length);
  res.addAll([i32x4(11), i32x4(12)]);
  Expect.equals(9, res.length);

  res.removeLast();
  Expect.equals(8, res.length);
  res.clear();
  Expect.equals(0, res.length);
}
