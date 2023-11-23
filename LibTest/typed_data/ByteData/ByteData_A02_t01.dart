// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion ByteData(int length)
/// Creates a ByteData of the specified [length] (in elements), all of whose
/// bytes are initially zero.
/// @description Checks that it is an error if [length] is not a non-negative
/// integer.
/// @note undocumented
/// @author msyabro


import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(length) {
  Expect.throws(() => ByteData(length));
}

main() {
  check(-1);
  check(-100);
  check(-0.5);
  check(1.1);
  check("1");
  check(new Object());
  check([0]);
}
