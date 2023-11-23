// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Float32x4List(int length)
/// Creates an [Float32x4List] of the specified length (in elements), all of
/// whose elements are initially zero.
/// @description Checks that an instance of Float32x4List of the specified length
/// is created.
/// @author msyabro

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(int length) {
  Float32x4List l = new Float32x4List(length);
  Expect.isTrue(l is Float32x4List);
  Expect.runtimeIsType<Float32x4List>(l);
  Expect.equals(l.length, length);
}

main() {
  check(0);
  check(1);
  check(10);
  check(1024);
  check(2048);
}
