// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future addStream(Stream stream)
///  Sends data from a stream on WebSocket connection. Each data event from
///  stream will be send as a single WebSocket frame. The data from stream must
///  be either Strings, or List<int>s holding bytes.
/// @description Checks that the String data are sent on the WebSocket
/// connection from server.
/// @author a.semenov@unipro.ru

import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";
import "../http_utils.dart";

main() {
  asyncTest<HttpServer>(
    (HttpServer? server) async =>
      AsyncExpect.data(
        ["Hello", ",", "World"],
        await WebSocket.connect("ws://${server?.address.address}:${server?.port}/")
      ),
    setup: () => spawnWebSocketServer(
      (WebSocket ws) async {
        await ws.addStream(new Stream.fromIterable(["Hello", ",", "World"]));
        ws.close();
      }
    ),
    cleanup: (HttpServer? server) => server?.close()
  );
}
