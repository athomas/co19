// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For each generative constructor of the form
/// Sq(T1 a1, ..., Tk ak, [Tk+1 ak+1 = d1, ..., Tk+p ak+p = dp]) of S that is
/// accessible to LC, C has an implicitly declared constructor of the form
/// Cq(T1 a1, ... , Tk ak, [Tk+1 ak+1 = d′1, ... , Tk+p ak+p = d′p]) :
///     superq(a1, ... , ak, ak+1, ..., ap);
/// where Cq is obtained from Sq by replacing occurrences of SN , which denote
/// the superclass, by N, superq is obtained from Sq by replacing occurrences of
/// SN which denote the superclass by super, and d′i, i ∈ 1..p, is a constant
/// expression evaluating to the same value as di.
///
/// @description Checks that for each generative constructor of the form
/// Sq(T1 a1, . . ., Tk ak, [Tk+1 ak+1 = d1, ..., Tk+p ak+p = dp]) a mixin
/// application implicitly declares constructor of the form
/// Cq(T1 a1, ... , Tk ak, [Tk+1 ak+1 = d′1, ... , Tk+p ak+p = d′p]) :
///     superq(a1, ... , ak, ak+1, ..., ap);
/// @author sgrekhov22@gmail.com

import "../../../Utils/expect.dart";

class A {
  bool v1;
  num v2;
  A(bool this.v1, [num this.v2 = 3.14]);
}

mixin class M1 {}

class C = A with M1;

main() {
  C c1 = C(true, 2);
  Expect.isTrue(c1.v1);
  Expect.equals(2, c1.v2);

  C c2 = C(false);
  Expect.isFalse(c2.v1);
  Expect.equals(3.14, c2.v2);
}
