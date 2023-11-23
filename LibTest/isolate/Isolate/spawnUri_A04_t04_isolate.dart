// Copyright (c) 2011-2016, the Dart project authors.  Please see the AUTHORS
// file for details. All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

/// @author a.semenov@unipro.ru

import "dart:isolate";

main(List args, SendPort sendPort) {
  ReceivePort receivePort = new ReceivePort();
  sendPort.send(receivePort.sendPort);
  receivePort.listen(
      (data) {
        sendPort.send(data);
        receivePort.close();
      }
  );
}
