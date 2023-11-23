// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion static const Zone root
/// The root zone that is implicitly created.
/// @description Checks that property root is of type Zone.
/// @author ilya

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  Expect.isTrue(Zone.root is Zone);
  Expect.runtimeIsType<Zone>(Zone.root);
}
