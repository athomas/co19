// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion StackTrace stackTrace
/// @description Checks that this property is not null if error is thrown
/// @author sgrekhov@unipro.ru
/// @issue 42896
/// @issue 41763

import "../../../Utils/expect.dart";

main() {
  Error e = new Error();
  Expect.isNull(e.stackTrace);
  try {
    throw e;
  } on Error catch (er) {
    Expect.isNotNull(e.stackTrace);
  }
}
