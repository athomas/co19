// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool requestClientCertificate
/// final
///
/// @description Checks that property requestClientCertificate returns true, if
/// the corresponding parameter of bind method is set to true.
/// @author ngl@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";

check(InternetAddress address) {
  asyncStart();
  SecurityContext sc = new SecurityContext(withTrustedRoots: true);
  RawSecureServerSocket
      .bind(address, 0, sc, requestClientCertificate: true)
      .then((server) {
    Expect.isTrue(server.requestClientCertificate);
    server.close();
    asyncEnd();
  });
}

main() {
  check(InternetAddress.anyIPv4);
  check(InternetAddress.anyIPv6);
  check(InternetAddress.loopbackIPv4);
  check(InternetAddress.loopbackIPv6);
}
