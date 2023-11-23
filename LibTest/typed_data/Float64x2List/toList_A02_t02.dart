// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion List<E> toList({bool growable: true})
/// ...
/// The list is fixed-length if growable is false.
/// @description Checks that the returned list isn't fixed-length if growable is
/// true.
/// @author ngl@unipro.ru


import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

main() {
  var l = new Float64x2List.fromList([f64x2(6.0), f64x2(1.0), f64x2(4.0)]);
  var res = l.toList(growable: true);
  Expect.equals(3, res.length);

  res.length = 2;
  Expect.equals(2, res.length);

  res.add(f64x2(3.0));
  Expect.equals(3, res.length);
}
