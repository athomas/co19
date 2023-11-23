// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion String toString()
/// Returns a string representation of this object.
/// @description Checks that a [String] is returned.
/// @author msyabro

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(count) {
  var buffer = new Int8List(count).buffer;
  var res = buffer.toString();
  Expect.isTrue(res is String);
  Expect.runtimeIsType<String>(res);
}

main() {
  check(0);
  check(1);
  check(5);
  check(100);
}
