// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If f is marked async*, then a fresh instance s implementing
/// the built-in class Stream is associated with the invocation and
/// immediately returned. When s is listened to, execution of the body of f will
/// begin. When f terminates:
///   • If the current return value is defined then, if s has been canceled
///   then its cancellation future is completed with null.
///   • If the current exception x is defined:
///     – x is added to s.
///     – If s has been canceled then its cancellation future is completed with
///     x as an error.
///   • s is closed.
///
/// @description Check that body of async generator function is not executed
/// before Stream instance is returned.
///
/// @author a.semenov@unipro.ru

import 'dart:async';
import '../../../Utils/expect.dart';

bool bodyExecuted = false;

Stream test() async* {
  bodyExecuted = true;
  yield 1;
}

main() {
  for (var i = 0; i < 10; i++) {
    test();
    Expect.isFalse(bodyExecuted);
  }
}
