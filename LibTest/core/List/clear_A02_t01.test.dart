// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion abstract void clear()
/// Throws an UnsupportedError, and retains all elements,
/// if the length of the list cannot be changed.
/// @description Checks that exception is thrown if the list is not extendable.
/// @author kaigorodov

library clear_A02_t01;

import "../../../Utils/expect.dart";

void check(List a) {
  Expect.throws(() {a.clear();}, (e) => e is UnsupportedError);
}

test(List<E> create<E>([int length, E fill])) {
  List<int?> a = create<int?>(0, 0);
  check(a);

  a = create<int?>(1, 0);
  a[0] = null;
  check(a);

  a = create<int?>(3, 0);
  a[0] = 1;
  a[1] = 1;
  a[2] = 1;
  check(a);

  a = create<int?>(89356, 0);
  check(a);
}
