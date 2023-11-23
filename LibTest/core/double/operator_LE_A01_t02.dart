// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool operator <=(num other)
/// @description Checks operator <= when 'other' is of type int.
/// @author pagolubev

import "../../../Utils/expect.dart";

check(double d, int i, bool lessThan) {
  if (lessThan)
    Expect.isTrue(d <= i, 'Expected $d < $i');
  else
    Expect.isFalse(d <= i, 'Expected !($d < $i)');
}

main() {
  check(-1/0, -9007199254740991, true); // -infinity < -2^53
  check(-1.7976931348623157e308, -9007199254740991, true); // -maxdouble < -2^53

  check(-100.00000000000001, -100, true);
  check(-100.0, -100, true);
  check(-99.99999999999999, -100, false);

  check(-1.0000000000000002, -1, true);
  check(-1.0, -1, true);
  check(-.9999999999999999, -1, false);

  check(-4.9406564584124654e-324, 0, true); // -mindouble < 0

  check(-.0, 0, true);
  check(.0, 0, true);

  check(4.9406564584124654e-324, 0, false); // !(mindouble < 0)

  check(.9999999999999999, 1, true);
  check(1.0, 1, true);
  check(1.0000000000000002, 1, false);

  check(99.99999999999999, 100, true);
  check(100.0, 100, true);
  check(100.00000000000001, 100, false);

  check(1.7976931348623157e308, 9007199254740991, false); // !(maxdouble < 2^53 - 1)
  check(1/0, 9007199254740991, false); // !(infinity < 2^53 - 1)

  check(9007199254740991.0, 9007199254740991, true);
  check(-9007199254740991.0, -9007199254740991, true);
}
