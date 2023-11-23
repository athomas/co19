// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool isBroadcast
/// Read-only
/// @description Checks that [isBroadcast] is a read-only property.
/// @author iarkh@unipro.ru

import "../../../Utils/expect.dart";
import "dart:io";

main(List<String> args) {
  dynamic check = stdin;
  Expect.throws(() { check.isBroadcast = true; },
      (e) => e is NoSuchMethodError);
}
