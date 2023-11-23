// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion static void isNull(var actual, [String reason = ''])
/// Descriptive error message is provided in case of failure.
/// @description Checks that message of thrown ExpectException includes 
/// representation of the actual value, as well as the reason.
/// @author varlax

import "../../../Utils/expect.dart";

main() {
  check(0);
  check(0, "");
  check(0, "not empty");

  check(true);
  check(true, "");
  check(true, "not empty");

  check(false);
  check(false, "");
  check(false, "not empty");

  check(new Object());
  check(new Object(), "");
  check(new Object(), "not empty");
}

void check(var arg, [String reason = '']) {
  try {
    Expect.isNull(arg, reason);
    throw new Exception("ExpectException expected");
  } on ExpectException catch(e) {
    String msg = e.message as String;
    if (!msg.contains(arg.toString(), 0)) throw "no actual value";
    if (reason != null && !reason.isEmpty && !msg.contains(reason, 0))
      throw "no reason";
  }
}
