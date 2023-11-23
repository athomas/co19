// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The yield statement adds an element to the result of a generator
/// function.
///  yieldStatement:
///    yield expression ‘;’
///   ;
///
/// @description Check correct usage of yield statement in synchronous
/// generator function
///
/// @author a.semenov@unipro.ru

import '../../../../Utils/expect.dart';

Iterable<int> test() sync* {
  yield 1;
}

main() {
  int k = 0;
  for (int i in test()) {
    k = k + i;
  }
  Expect.equals(1, k);
}
