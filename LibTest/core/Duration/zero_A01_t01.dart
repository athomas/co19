// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Duration ZERO = const Duration(seconds: 0)
/// @description Checks that the value of this property is correct.
/// @author sgrekhov@unipro.ru

import "../../../Utils/expect.dart";

main() {
  Expect.equals(new Duration(seconds: 0).inMicroseconds,
      Duration.zero.inMicroseconds);
}
