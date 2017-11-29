/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertionString userAgent
 *  read / write
 * Set and get the default value of the User-Agent header for all requests
 * generated by this HttpClient. The default value is Dart/<version> (dart:io).
 *
 * If the userAgent is set to null, no default User-Agent header will be added
 * to each request.
 * @description Checks that default value is Dart/<version> (dart:io)
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:convert";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

var localhost = InternetAddress.LOOPBACK_IP_V4.address;

test() async {
  String version = Platform.version.substring(
      0, Platform.version.indexOf(".", Platform.version.indexOf(".") + 1));

  String helloWorld = 'Hello, test world!';
  HttpServer server = await HttpServer.bind(localhost, 0);
  asyncStart();
  server.listen((HttpRequest request) {
    Expect.listEquals(
        ["Dart/${version} (dart:io)"], request.headers[HttpHeaders.USER_AGENT]);
    request.response.write(helloWorld);
    request.response.close();
    server.close();
    asyncEnd();
  });

  HttpClient client = new HttpClient();

  Expect.equals("Dart/${version} (dart:io)", client.userAgent);
  asyncStart();
  client
      .getUrl(Uri.parse("http://$localhost:${server.port}"))
      .then((HttpClientRequest request) {
    return request.close();
  }).then((HttpClientResponse response) {
    Expect.equals(HttpStatus.OK, response.statusCode);
    response.transform(UTF8.decoder).listen((content) {
      Expect.equals(helloWorld, content);
      asyncEnd();
    });
  });
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
