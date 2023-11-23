// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future drain([futureValue])
/// In case of a done event the future completes with the given futureValue.
/// @description Checks that the future completes with null if futureValue is omitted.
/// @author kaigorodov

import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateStream.dart" as IsolateStream;

void check(Stream s) {
  Future f = s.drain();
  asyncStart();
  f.then((value) {
    Expect.equals(null, value);
    asyncEnd();
  });
}

main() {
  check(IsolateStream.fromIterable([]));
  check(IsolateStream.fromIterable(
      new Iterable.generate(10, (int index) => index)));
}
