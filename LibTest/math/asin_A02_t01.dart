// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion double asin(num x)
/// Returns a value in the range -PI/2..PI/2, or NaN if [x] is outside the range
/// -1..1.
/// @description Checks returned values on arguments outside [-1, 1].
/// @author msyabro

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  Expect.isTrue(Math.asin(-10).isNaN);
  Expect.isTrue(Math.asin(10).isNaN);
  Expect.isTrue(Math.asin(1.0000000000001).isNaN);
  Expect.isTrue(Math.asin(-1.0000000000001).isNaN);

  Expect.isTrue(Math.asin(double.nan).isNaN);
  Expect.isTrue(Math.asin(double.infinity).isNaN);
  Expect.isTrue(Math.asin(double.negativeInfinity).isNaN);
}
