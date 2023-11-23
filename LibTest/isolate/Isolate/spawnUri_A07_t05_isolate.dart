// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS
// file for details. All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

/// @author a.semenov@unipro.ru

import "dart:async";
import "IsolateUtil.dart";

main() {
  dynamic i1 = 1, i2 = 2, i3 = 3, i4 = 4;
  // second error
  new Future.delayed(ONE_SECOND, () => "b" + i2);
  // third error
  new Future.delayed(TWO_SECONDS, () => "c" + i3);
  // fourth error
  new Future.delayed(THREE_SECONDS, () => "d" + i4);
  // first error
  var x = "a" + i1;
}
