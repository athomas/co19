// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The result of a lookup of method m in class C with respect to
/// library L is: If C declares a concrete instance method named m that is
/// accessible to L, then that method is the result of the lookup. Otherwise,
/// if C has a superclass S, then the result of the lookup is the result of
/// looking up m in S with respect to L. Otherwise, we say that the method
/// lookup has failed.
/// @description Checks that static methods are skipped during lookup.
/// @author sgrekhov@unipro.ru

import '../../../../Utils/expect.dart';

class A {
  int m() => 1;
}

class C extends A {
  int m();
  static int s() => 0;
}

main() {
  dynamic c = new C();
  Expect.equals(1, c.m());
  Expect.throws(() {c.s();}, (e) => e is NoSuchMethodError);
}
