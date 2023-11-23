// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Strings support escape sequences for special characters. The
/// escapes are:
/// . . .
/// • \b for backspace, equivalent to \x08.
/// @description Checks that \b is equivalent to \x08.
/// @author msyabro

import '../../../Utils/expect.dart';

main() {
  const escapeB = '\b';
  const escapeX = '\x08';

  const CheckIdentical(escapeB, escapeX);
}
