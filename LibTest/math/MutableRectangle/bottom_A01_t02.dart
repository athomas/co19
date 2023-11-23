// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion T bottom
/// The y-coordinate of the bottom edge.
/// @description Checks that bottom is read-only and cannot be set.
/// @author ngl@unipro.ru

import "dart:math";
import "../../../Utils/expect.dart";

main() {
  dynamic r = new MutableRectangle(2, 1, 20, 15);
  Expect.throws(() {r.bottom = 17;}, (e) => e is NoSuchMethodError);
}
