// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion double cos(num radians)
/// Converts [radians] to a double and returns the sine of the value.
/// @description Checks that an argument of sin should be a number (a decimal
/// or hexadecimal integer, or a decimal double).
/// @author ngl@unipro.ru

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  var a1 = Math.sin(0);
  var a2 = Math.sin(0x0000);
  var a3 = Math.sin(0.0);
  Expect.equals(a1, a2);
  Expect.equals(a1, a3);
}
