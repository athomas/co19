// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion  abstract int truncate()
/// Returns the integer obtained by discarding any fractional digits from this.
/// @description Checks truncation of special values.
/// @author pagolubev

import "../../../Utils/expect.dart";

check(int expected, double argument) {
  Expect.equals(expected, argument.truncate());
  Expect.equals(-expected, (-argument).truncate());
}

main() {
  check(0, .0);
  check(0, -.0);
  check(0, 4.9406564584124654e-324); // min subnormal
  check(0, 2.2250738585072014e-308); // min normal
}
