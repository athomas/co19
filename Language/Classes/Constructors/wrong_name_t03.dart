// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constructor name always begins with the name of its immediately
/// enclosing class or interface, and may optionally be followed by a dot and an
/// identifier id.  .  .  .   It is a compile-time error if the name of a
/// constructor is not a constructor name.
/// @description Checks that type alias cannot be used as a default constructor
/// @author sgrekhov@unipro.ru

import "../../../Utils/expect.dart";
class C {
  String log = "No";

  CAlias() {
    log = "Yes";
  }
}
typedef CAlias = C;

main() {
  C c = new CAlias();
  Expect.equals("No", c.log);
}
