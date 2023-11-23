// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Strings support escape sequences for special characters. The
/// escapes are:
/// . . .
/// • \f for form feed, equivalent to \x0C.
/// @description Checks that \f is equivalent to \x0C.
/// @author msyabro

import '../../../Utils/expect.dart';

main() {
  const escapeF = '\f';
  const escapeX = '\x0C';

  const CheckIdentical(escapeF, escapeX);
}
