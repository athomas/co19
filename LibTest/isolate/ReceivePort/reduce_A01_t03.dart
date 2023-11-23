// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future<T> reduce(T combine(T previous, T element))
/// Reduces a sequence of values by repeatedly applying combine.
/// @description Checks that if the stream contains no elements, the combine method
/// is not called and the future returns an error.
/// @note undocumented
/// @author kaigorodov

import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateStream.dart" as IsolateStream;

void check(Iterable data, combine(previous, var element)) {
  Stream s = IsolateStream.fromIterable(data);
  asyncStart();
  Future f = s.reduce(combine);
  f.then((value) {
    Expect.fail("unexpected call to onValue($value)");
  }, onError: (Object error) {
    asyncEnd();
  });
}

main() {
  check([], (p, e) {Expect.fail("combine musn't be called");});
}
