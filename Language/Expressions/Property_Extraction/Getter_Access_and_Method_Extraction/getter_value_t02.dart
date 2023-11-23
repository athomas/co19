// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Otherwise, the body of f is executed with this bound to o. The
/// value of i is the result returned by the call to the getter function.
/// @description Check that extracted static getter value is call of
/// the getter function
/// @author sgrekhov@unipro.ru

import '../../../../Utils/expect.dart';

class C {
  static int get g => 1;
}

main() {
  var f = C.g;
  Expect.equals(1, f);
}
