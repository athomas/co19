// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A function type T may be assigned to a function type S, written
/// T ⇐⇒ S, iff T <: S.
/// @description Checks that a function type T may be assigned to a function type
/// S, iff T <: S.
/// @author ngl@unipro.ru

import "../../../Utils/expect.dart";

class A {}
class B extends A {}
class C extends B {}

class X {}

typedef C t1(C c);

main() {
  t1 x1a = (A x) => new C();
  t1 x1b = (B x) => new C();
  t1 x1c = (C x) => new C();

  Expect.isTrue((A x) {return new C();} is t1);
  Expect.runtimeIsType<t1>((A x) {return new C();});
  Expect.isTrue((B x) {return new C();} is t1);
  Expect.runtimeIsType<t1>((B x) {return new C();});
  Expect.isTrue((C x) {return new C();} is t1);
  Expect.runtimeIsType<t1>((C x) {return new C();});
  Expect.isFalse((X x) {return new C();} is t1);
  Expect.runtimeIsNotType<t1>((X x) {return new C();});
}
