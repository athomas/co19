// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let v be a local variable or a formal parameter. An is-expression
/// of the form v is T shows that v has type T iff T is more specific than the
/// type S of the expression v and both T != dynamic and S != dynamic.
/// @description Checks that if v is an instance variable, is-expression does
/// not show that v has type T.
/// @author ilya

import '../../../Utils/expect.dart';

class C {}

class D extends C {
  f() {}
}

class S {
  C? x1;
  C x2 = C();

  test() {
    Expect.isFalse(x1 is D);
    Expect.isFalse(x2 is D);
  }
}

main() {
  new S().test();
}
