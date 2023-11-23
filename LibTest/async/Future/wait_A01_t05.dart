// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future<List> wait(Iterable<Future> futures,
///                {bool eagerError: false, void cleanUp(successValue)})
/// Wait for all the given futures to complete and collect their values.
/// Returns a future which will complete once all the futures in a list are
/// complete.
/// @description Checks that the returned future has the correct value if
/// a list contains only one element.
/// @author msyabro

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  var completer = new Completer();
  var future = completer.future;

  var f = Future.wait([future]);

  asyncStart();
  f.then((value) {
    Expect.listEquals([1], value);
    asyncEnd();
  });

  completer.complete(1);
}
