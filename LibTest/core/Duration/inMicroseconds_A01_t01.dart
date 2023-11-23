// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion int inMicroseconds
/// Returns number of whole microseconds spanned by this Duration.
/// @description Checks that duration calculation is correct (sum of all
/// properties multiplied by the appropriate number of microseconds)
/// @author sgrekhov@unipro.ru

import "../../../Utils/expect.dart";

main() {
  check(0, 0, 0, 0, 0, 0);
  check(0, 0, 0, 0, 1, 1);
  check(0, 0, 0, 0, -1, 1);
  check(1, 1, 1, 1, 1, 1);
  check(-1, -1, -1, -1, -1, -1);
  check(9007199254740991, 9007199254740991, 9007199254740991,
      9007199254740991, 9007199254740991, 9007199254740991);
  check(-9007199254740991, -9007199254740991, -9007199254740991,
      -9007199254740991, -9007199254740991, -9007199254740991);
}

void check(int d, int h, int m, int s, int ms, int mc) {
  Expect.equals(
      (mc + (ms + (s + ((m + (h + d * 24) * 60) * 60)) * 1000) * 1000),
      new Duration(days: d, hours: h, minutes: m, seconds: s, milliseconds: ms,
          microseconds: mc).inMicroseconds);
}
