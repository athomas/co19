// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Int32x4 operator |(Int32x4 other)
/// The bit-wise or operator.
/// @description Checks that every lane of the new [Int32x4] equals the result
/// of applying bit-wise or operator to corresponding lanes of operands.
/// @note undocumented
/// @author msyabro

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(x1, y1, z1, w1, x2, y2, z2, w2) {
  var obj1 = new Int32x4(x1, y1, z1, w1);
  var obj2 = new Int32x4(x2, y2, z2, w2);
  var res = obj1 | obj2;

//  Expect.equals(x1|x2, res.x);
  Expect.equals(x1.toUnsigned(32) | x2.toUnsigned(32), res.x.toUnsigned(32));
  Expect.equals(y1.toUnsigned(32) | y2.toUnsigned(32), res.y.toUnsigned(32));
  Expect.equals(z1.toUnsigned(32) | z2.toUnsigned(32), res.z.toUnsigned(32));
  Expect.equals(w1.toUnsigned(32) | w2.toUnsigned(32), res.w.toUnsigned(32));
}

main() {
  check(0, 0, 0, 0, 0, 0, 0, 0);
  check(-1, 0, 0, 0, 0, 0, 0, 0);
  check(1, 1, 1, 1, 1, 1, 1, 1);
  check(0, 1, 0, 1, 1, 0, 1, 0);

  if (!isJS) {
    check(0xff7812a1, 0x1903c8e4, 0x35c7de18, 0x3619c6ff,
          0x829c02ac, 0xf367c6e1, 0x367c8d9f, 0xc637ba81);
    check(0x80000000, 0x00ff00ff, 0xC0000000, 0xffffffff,
          0x00000001, 0x00ff0000, 0x40000000, 0x01010101);
  }
}
