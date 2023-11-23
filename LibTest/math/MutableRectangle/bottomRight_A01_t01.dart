// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Point<T> bottomRight
/// Point<T> get bottomRight =>
///   new Point<T>(this.left + this.width, this.top + this.height);
/// @description Checks that the returned value is correct.
/// @note undocumented
/// @author ngl@unipro.ru

import "dart:math";
import "../../../Utils/expect.dart";

main() {
  MutableRectangle r = new MutableRectangle(2, 1, 20, 15);
  Point bottomRight = r.bottomRight;
  Expect.equals(r.left + r.width, bottomRight.x);
  Expect.equals(r.top + r.height, bottomRight.y);
}
