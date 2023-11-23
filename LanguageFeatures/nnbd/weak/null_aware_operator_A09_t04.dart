// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The assignment e1?.f = e2 translates to:
///  SHORT[EXP(e1), fn[x] => x.f = EXP(e2)]
///
///  The other assignment operators are handled equivalently.
///
/// @description Check that assignments like e1?.f /= e2 translates to:
///  SHORT[EXP(e1), fn[x] => x.f /= EXP(e2)]
/// @author sgrekhov@unipro.ru

// Requirements=nnbd-weak
import "../../../Utils/expect.dart";

class C {
  double test = 12;
  init() {
    test = 12;
  }
}

void testShort(C? x, int e2) {
  x?.init();
  var actual1 = x?.test /= e2;
  x?.init();
  var n0 = x;
  var expected1 = n0 == null ? null : n0.test /= e2;
  Expect.equals(expected1, actual1);
}

main() {
  C? c1 = null;
  testShort(c1, 4);
  c1 = new C();
  testShort(c1, 4);

  C c2 = new C();
  testShort(c2, 4);
}
