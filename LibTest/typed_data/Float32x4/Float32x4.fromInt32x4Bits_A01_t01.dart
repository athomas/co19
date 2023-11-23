// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Float32x4.fromInt32x4Bits(Int32x4 x)
/// Returns a bit-wise copy of x as a Float32x4.
/// @description Checks that lanes are converted correctly.
/// @author msyabro


import "dart:typed_data";
import "../../../Utils/expect.dart";

check(x, y, z, w, floatX, floatY, floatZ, floatW) {
  var obj1 = new Int32x4(x, y, z, w);
  var obj2 = new Float32x4.fromInt32x4Bits(obj1);

  Expect.equals(floatX, obj2.x);
  Expect.equals(floatY, obj2.y);
  Expect.equals(floatZ, obj2.z);
  Expect.equals(floatW, obj2.w);
}

main() {
  check(0, 0, 0, 0, 0.0, 0.0, 0.0, 0.0);
  check(0x00ffffff, 0x10101010, 0x11111111, 0x00abcdef, 2.3509885615147286e-38,
      2.8411366687849113e-29, 1.1443742118159064e-28, 1.5777744896757237e-38);
  check(0xab31cf47, 0x31d4f7e0, 0x47f1e400, 0x31ffe4dd, -6.317068721416186e-13,
      6.198192181727791e-9, 1.23848e5, 7.4474955091829997e-9);
}
