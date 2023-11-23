// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion List<int> rawAddress
/// The result is either a [4] or [16] byte long list.
/// @description Checks that for IPv6 addresses 16-byte [List] is returned.
/// @author iarkh@unipro.ru


import "../../../Utils/expect.dart";
import "dart:io";

check(String addr) {
  InternetAddress address = new InternetAddress(addr);
  List<int> list = address.rawAddress;
  Expect.equals(16, list.length);
}

main() {
  check("19:abc:14:128:22:11:a13d:0");
  check("::");
  check("::1");
  check("::11:124:a");
  check("11:124:a::");
  check("11:124:a::d:113");
}
