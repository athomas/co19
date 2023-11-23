// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion N/A
/// @description Checks that left shift works with integers as expected
/// @author sgrekhov@unipro.ru

import '../../../Utils/expect.dart';

main() {
  int i = 1;
  Expect.equals(2, i << 1);
  Expect.equals(4, i << 2);
  Expect.equals(8, i << 3);
  Expect.equals(16, i << 4);
  Expect.equals(32, i << 5);
  Expect.equals(64, i << 6);

  Expect.equals(0, i << 64);
  Expect.equals(0, i << 65);
  Expect.equals(0, i << 100);

  if (!isJS) {
    int j = 0x7FFFFFFFFFFFF000;
    Expect.equals(-8192, j << 1);
    Expect.equals(-16384, j << 2);
    Expect.equals(-32768, j << 3);
    Expect.equals(-65536, j << 4);
    Expect.equals(-131072, j << 5);
    Expect.equals(-262144, j << 6);
    Expect.equals(0, j << 64);
    Expect.equals(0, j << 65);
    Expect.equals(0, j << 100);
  }
}
