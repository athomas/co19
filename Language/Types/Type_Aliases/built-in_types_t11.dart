/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Test for type aliases for built-in types
 * @description Checks triple shift via type alias for int
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases,triple-shift
import '../../../Utils/expect.dart';

typedef IntAlias = int;

main() {
  IntAlias i = 1;

  Expect.equals(0, i >>> 1);
  Expect.equals(0, i >>> 2);
  Expect.equals(0, i >>> 64);
  Expect.equals(0, i >>> 100);

  int j = 0x7FFFFFFFFFFFFFFF;
  Expect.equals(4611686018427387903, j >>> 1);
  Expect.equals(2305843009213693951, j >>> 2);
  Expect.equals(1152921504606846975, j >>> 3);

  int k = 129;
  Expect.equals(0, k >>> 261);

  int l = 1295555555;
  Expect.equals(l, l >>> 0);

  i = 0x8000000000000000;
  Expect.equals(0x4000000000000000, i >>> 1);
}
