// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool isBroadcast
/// Whether this stream is a broadcast stream.
/// @description Checks that the [isBroadcast] returns false.
/// @author ngl@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";

main() {
  HttpServer.bind("127.0.0.1", 0).then((server) {
    server.listen((request) {
      WebSocketTransformer
          .upgrade(request)
          .then((websocket) async {
        Expect.isFalse(websocket.isBroadcast);
        await websocket.close();
        Expect.isFalse(websocket.isBroadcast);
      });
    });

    var webs = WebSocket.connect("ws://127.0.0.1:${server.port}/");
    webs.then((client) {
      Expect.isFalse(client.isBroadcast);
      client.close().then((_) {
        Expect.isFalse(client.isBroadcast);
        server.close();
      });
    });
  });
}
