// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// int terminalColumns
/// Read-only
/// @description Checks that [terminalColumns] is a read only field.
/// @author iarkh@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";

main() {
  dynamic out = stdout;
  Expect.throws(() { out.terminalColumns = 5; }, (e) => e is NoSuchMethodError);
  out = stderr;
  Expect.throws(() { out.terminalColumns = 22; }, (e) => e is NoSuchMethodError);
}
