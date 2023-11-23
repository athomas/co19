// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The mixinMember production allows the same instance or static
/// members that a class would allow, but no constructors (for now).
///
/// @description Checks that mixin declaration allows same instance or static
/// members that a class would allow. Test abstract members and type parameters
/// @author ngl@unipro.ru
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

class S {}
class T {}
class X extends S {}
class Y extends T {}

class I<T1> {}
class J<T1> {}
class B<T1> {}
class C<T1> {}

mixin M<X1 extends S, Y1 extends T> on B<X1>, C<Y1> implements I<S>, J<T> {
  static String s = "S.s";
  static String get gs => s;
  static set ss(String v) {
    s = v;
  }
  static String sf() => "S.sf()";

  Y1? i;
  Y1? get gi;
  set si(Y1 v);
  Y1? mi();
  Type operator ~();
}

class A<T1, T2, T3, T4> implements B<T1>, C<T2>, I<T3>, J<T4> {
}

class MA<X1 extends X, Y1 extends Y> extends A<X, Y1, S, T> with M<X, Y1> {
  Y1? i = null;
  Y1? get gi => i;
  set si(Y1 v) {
    i = v;
  }
  Y1? mi() => null;
  Type operator ~() => i.runtimeType;
}

main() {
  Expect.equals("S.s", M.s);
  Expect.equals("S.sf()", M.sf());
  Expect.equals("S.s", M.gs);
  M.ss = "x";
  Expect.equals("x", M.gs);

  MA ma = new MA<X, Y>();
  Expect.equals(Null, ~ma);
}
