// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS
// file for details. All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

/// @assertion If the errorAreFatal, onExit and/or onError parameters are
/// provided, the isolate will act as if, respectively, setErrorsFatal,
/// addOnExitListener and addErrorListener were called with the corresponding
/// parameter and was processed before the isolate starts running.
///
/// @description Check that if onError parameter is supplied, the isolate
/// captures and sends all errors on given send port, errorAreFatal is false.
/// The isolate is active.
/// @author a.semenov@unipro.ru

import "dart:isolate";
import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateUtil.dart";

void entryPoint(message) {
  dynamic i1 = 1, i2 = 2;
  // second error
  new Future.delayed(ONE_SECOND, () => "b" + i2);
  // first error
  var x = "a" + i1;
}

test() async {
  ReceivePort errorPort = new ReceivePort();
  Isolate.spawn(entryPoint, "hello",
      errorsAreFatal: false, onError: errorPort.sendPort);
  var count = 0;
  await for (var error in errorPort) {
    Expect.isTrue(count < 2, "received unexpected data $error");
    Expect.isTrue(error is List);
    Expect.equals(2, error.length);
    Expect.isTrue(error[0] is String);
    Expect.isTrue(error[1] is String);
    count++;
    if (count == 2) {
      new Future.delayed(TWO_SECONDS, () => errorPort.close());
    }
  }
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
