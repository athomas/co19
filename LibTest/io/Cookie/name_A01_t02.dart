// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion String name
/// read / write
/// Gets and sets the name.
/// @description Checks that this property gets and sets the domain. Test setting
/// unacceptable value
/// @issue 29495
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Cookie cookie = new Cookie.fromSetCookieValue(" cname = cval; Domain=dartlang.org");
  Expect.equals("cname", cookie.name);

  Expect.throws(() {cookie.name = " cname ";});
}
