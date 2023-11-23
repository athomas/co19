// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Returns whether this string ends with [other].
/// @description Checks that this method is case sensitive
/// @author msyabro

import "../../../Utils/expect.dart";

main() {
  String str = "String";
  Expect.isTrue(str.endsWith("g") == true);
  Expect.isTrue(str.endsWith("G") == false);
}
