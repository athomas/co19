// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Int64List(int length)
/// Creates an [Int64List] of the specified length (in elements), all of whose
/// elements are initially zero.
/// @description Checks that an instance of Int64List of the specified length is
/// created.
/// @author msyabro


import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(int length) {
  var l = new Int64List(length);
  Expect.isTrue(l is Int64List);
  Expect.runtimeIsType<Int64List>(l);
  Expect.equals(l.length, length);
}

main() {
  check(0);
  check(1);
  check(10);
  check(1024);
  check(2048);
}
