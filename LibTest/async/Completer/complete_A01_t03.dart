// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void complete([T value])
/// Completes future with the supplied values.
/// The value must be either a value of type T or a future of type Future<T>.
/// If the value is itself a future, the completer will wait for that future to
/// complete, and complete with the same result, whether it is a success or an
/// error.
/// All listeners on the future are informed about the value.
/// @description Checks that single listener on the future is informed.
/// @author kaigorodov

import "../../../Utils/expect.dart";

import "dart:async";

main() {
  var completer = new Completer();
  var future = completer.future;

  future.then((fValue) {
    Expect.equals(1, fValue);
    asyncEnd();
  });

  asyncStart();
  completer.complete(1);
}
