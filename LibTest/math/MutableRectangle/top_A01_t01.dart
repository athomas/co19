// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion T top
/// The y-coordinate of the left edge.
/// @description Checks that the returned value is correct.
/// @author ngl@unipro.ru

import "dart:math";
import "../../../Utils/expect.dart";

main() {
  MutableRectangle r = new MutableRectangle(2, 1, 20, 15);
  Expect.equals(1, r.top);
}
