// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion const Stream.empty()
/// Creates an empty broadcast stream.
///
/// This is a stream which does nothing except sending a done event when it's
/// listened to.
///
/// @description Checks that Stream.empty() constructor creates empty stream.
/// @author a.semenov@unipro.ru

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  AsyncExpect.value([], new Stream.empty().toList());
}
