// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion InternetAddress address
/// Returns the address that the server is listening on. This can be used to get
/// the actual address used, when the address is fetched by a lookup from a
/// hostname.
/// @description Checks that this property returns the address that the server is
/// listening on. Test HttpServer.listenOn constructor
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";

main() {
  asyncStart();
  HttpServer? server = null;
  ServerSocket? socket = null;
  ServerSocket.bind(InternetAddress.loopbackIPv4, 0).then((ServerSocket s) {
    socket = s;
    server = new HttpServer.listenOn(s);
    Expect.equals(InternetAddress.loopbackIPv4, server?.address);
    asyncEnd();
  }).whenComplete(() {
    server?.close();
    socket?.close();
  });
}
