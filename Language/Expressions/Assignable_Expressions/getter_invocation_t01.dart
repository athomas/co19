// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An assignable expression of the form e.id or e?.id is evaluated
/// as a property extraction.
/// @description Checks that expression of the form e.id is evaluated
/// as a getter invocation.
/// @author msyabro


import '../../../Utils/expect.dart';

class A {
  var _x;
  var y;

  A(): _x = 1, y = 1;

  get x {
    y = 20;
    return _x;
  }
}

main() {
  A a = new A();
  Expect.equals(1, a.x);
  Expect.equals(20, a.y);
}
