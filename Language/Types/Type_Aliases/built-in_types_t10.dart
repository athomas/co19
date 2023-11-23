// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Test for type aliases for built-in types
/// @description Checks right shift via type alias for int
/// @author sgrekhov@unipro.ru

import '../../../Utils/expect.dart';

typedef IntAlias = int;

main() {
  IntAlias i = 1;

  Expect.equals(0, i >> 1);
  Expect.equals(0, i >> 2);
  Expect.equals(0, i >> 64);
  Expect.equals(0, i >> 100);

  int j = 0x7FFFFFFFFFFFF000;
  if (isJS) {
    Expect.equals(2147481600, j >> 1);
    Expect.equals(1073740800, j >> 2);
    Expect.equals(536870400, j >> 3);
    Expect.equals(0, j >> 61);
    Expect.equals(0, j >> 62);
  } else {
    Expect.equals(4611686018427385856, j >> 1);
    Expect.equals(2305843009213692928, j >> 2);
    Expect.equals(1152921504606846464, j >> 3);
    Expect.equals(3, j >> 61);
    Expect.equals(1, j >> 62);
  }
  Expect.equals(0, j >> 63);
  Expect.equals(0, j >> 64);
  Expect.equals(0, j >> 65);
  Expect.equals(0, j >> 100);
}
