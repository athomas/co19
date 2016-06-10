/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the errorAreFatal, onExit and/or onError parameters are
 * provided, the isolate will act as if, respectively, setErrorsFatal,
 * addOnExitListener and addErrorListener were called with the corresponding
 * parameter and was processed before the isolate starts running.
 *
 * @description Check that with errorAreFatal set to true the isolate is
 * terminated on first error. The isolate is passive.
 *
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";
import "IsolateUtil.dart";

void entryPoint(List message) {
  SendPort sendPort = message[1];
  ReceivePort receivePort = new ReceivePort();
  receivePort.listen(
     (data) {
        sendPort.send(data);
        sendPort.send(", "+1); // cause an error that should stop the isolate
        sendPort.send("hello");
     }
  );
  message[0].send(receivePort.sendPort);
}

test() async {
  ReceivePort controlPort = new ReceivePort();
  ReceivePort receivePort = new ReceivePort();
  Future<List> receivedData = receivePort.toList();

  Isolate isolate = await Isolate.spawn(entryPoint,
                                  [controlPort.sendPort, receivePort.sendPort],
                                   errorsAreFatal:true);
  SendPort sendPort = await controlPort.first;

  sendPort.send("test1");
  sendPort.send("test2");
  sendPort.send("test3");

  await new Future.delayed(ONE_SECOND);
  Expect.equals("timeout", await ping(isolate, "ping", THREE_SECONDS));
  receivePort.close();
  Expect.listEquals(["test1"], await receivedData);
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
