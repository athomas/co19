// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
///    typeParameter ::= metadata identifier (extends typeNotVoid)?
///    typeParameters ::= ‘<’ typeParameter (‘,’ typeParameter)* ‘>’
/// ...
/// Type parameters are declared in the type parameter scope of a class or
/// function. The type parameters of a generic [G] are in scope in the bounds of
/// all of the type parameters of [G].
/// @description Checks that typedef type parameter is in the type parameter
/// scope.
/// @author iarkh@unipro.ru

import "../../Utils/expect.dart";

class A {}
class B extends A {}

typedef void Test<X1 extends A, X2 extends X1>(X1 exp1, X2 exp2);

void testme1(A x, A y) {}
void testme2(B x, A y) {}

main() {
  Expect.isTrue(testme1 is Test);
  Expect.runtimeIsType<Test>(testme1);
  Expect.isTrue(testme1 is Test<A, A>);
  Expect.runtimeIsType<Test<A, A>>(testme1);
  Expect.isTrue(testme1 is Test<A, B>);
  Expect.runtimeIsType<Test<A, B>>(testme1);
  Expect.isTrue(testme1 is Test<B, B>);
  Expect.runtimeIsType<Test<B, B>>(testme1);

  Expect.isFalse(testme2 is Test);
  Expect.runtimeIsNotType<Test>(testme2);
  Expect.isFalse(testme2 is Test<A, A>);
  Expect.runtimeIsNotType<Test<A, A>>(testme2);
  Expect.isFalse(testme2 is Test<A, B>);
  Expect.runtimeIsNotType<Test<A, B>>(testme2);
  Expect.isTrue(testme2 is Test<B, B>);
  Expect.runtimeIsType<Test<B, B>>(testme2);
}
