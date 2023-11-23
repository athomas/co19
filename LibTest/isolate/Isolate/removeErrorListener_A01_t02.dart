// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS
// file for details. All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

/// @assertion void removeErrorListener(
///                    SendPort port
///                 )
///    Stop listening for uncaught errors through port.
///    The port should be a port that is listening for errors through
/// addErrorListener. This call requests that the isolate stops sending errors
/// on the port.
///
/// @description Check that call to removeErrorListener() does not affect other
/// error listeners.
///
/// @author a.semenov@unipro.ru

import "dart:isolate";
import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateUtil.dart";

test() async {
  ReceivePort errorPort1 = new ReceivePort();
  StreamIterator errors1 = new StreamIterator(errorPort1);
  ReceivePort errorPort2 = new ReceivePort();
  StreamIterator errors2 = new StreamIterator(errorPort2);

  ErrorServer server = await ErrorServer.spawn(
    onError:errorPort1.sendPort,
    errorsAreFatal:false
  );
  server.isolate.addErrorListener(errorPort2.sendPort);

  for (int i=0; i<3; i++) {
    server.generateError();
    Expect.isTrue(await errors1.moveNext());
    Expect.equals(i.toString(), errors1.current[0]);
    Expect.isTrue(await errors2.moveNext());
    Expect.equals(i.toString(), errors2.current[0]);
  }

  server.isolate.removeErrorListener(errorPort2.sendPort);

  for (int i=3; i<5; i++) {
    server.generateError(); // these errors should not be received in errors2
    Expect.isTrue(await errors1.moveNext());
    Expect.equals(i.toString(), errors1.current[0]);
  }

  // check for unexpected events
  Expect.isFalse(await errors2.moveNext().timeout(ONE_SECOND, onTimeout:()=>false));

  server.requestStop();
  errorPort1.close();
  errorPort2.close();
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
