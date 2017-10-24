/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String serverHeader
 * read / write
 * Get and set the default value of the Server header for all responses
 * generated by this HttpServer.
 *
 * If serverHeader is null, no Server header will be added to each response.
 *
 * The default value is null.
 * @description Checks that the default value of this property is null
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

test() async {
  HttpServer server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 0);
  asyncStart();
  Expect.isNull(server.serverHeader);
  server.listen((HttpRequest request) {
    request.response.close();
    server.close();
    asyncEnd();
  });

  asyncStart();
  HttpClient client = new HttpClient();
  client
      .getUrl(Uri.parse(
      "http://${InternetAddress.LOOPBACK_IP_V4.address}:${server.port}"))
      .then((HttpClientRequest request) {
    return request.close();
  }).then((HttpClientResponse response) {
    response.headers.forEach((String name, List<String> value) {
      if (name == "server") {
        Expect.fail("server header shouldn't be set");
      }
    });
    asyncEnd();
  });
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
