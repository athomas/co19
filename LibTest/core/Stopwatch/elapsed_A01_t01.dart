// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion final Duration elapsed
/// Returns the elapsedTicks counter converted to a Duration.
/// @description Checks that the elapsed tick count increases all the time once
///              the stopwatch is started.
/// @author kaigorodov

import "dart:async";
import "../../../Utils/expect.dart";

Duration delay = durationInMilliseconds(50);
Stopwatch sw = new Stopwatch();
Duration e0 = new Duration();

main() {
  sw.start();
  e0 = sw.elapsed;
  asyncStart();
  new Timer(delay, proc1);
}

void proc1() {
  Duration e1 = sw.elapsed;
  Expect.isTrue(e1 > e0);
  asyncEnd();
}
