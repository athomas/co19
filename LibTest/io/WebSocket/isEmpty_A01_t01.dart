// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future<bool> isEmpty
/// Reports whether this stream contains any elements.
///
/// Stops listening to the stream after the first element has been received.
///
/// Internally the method cancels its subscription after the first element.
/// This means that single-subscription (non-broadcast) streams are closed and
/// cannot be reused after a call to this getter.
///
/// @description Checks that the [isEmpty] returns the Future<bool>.
/// @author ngl@unipro.ru

import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  HttpServer.bind("127.0.0.1", 0).then((server) {
    server.listen((request) {
      WebSocketTransformer
          .upgrade(request)
          .then((websocket) {
        var v = websocket.isEmpty;
        Expect.isTrue(v is Future<bool>);
        Expect.runtimeIsType<Future<bool>>(v);
        websocket.close();
      });
    });

    var webs = WebSocket.connect("ws://127.0.0.1:${server.port}/");
    webs.then((client) {
      bool called = false;
      client.isEmpty.then((value) {
        Expect.isTrue(value);
        called = true;
      });
      client.close().then((_) async {
        await server.close();
        Expect.isTrue(called);
      });
    });
  });
}
