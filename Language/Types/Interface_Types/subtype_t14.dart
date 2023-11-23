// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A type T is more specific than a type S, written T << S, if one
/// of the following conditions is met:
///  • T is S.
///  • T is ⊥
///  • S is dynamic.
///  • S is a direct supertype of T.
///  • T is a type parameter and S is the upper bound of T.
///  • T is a type parameter and S is Object.
///  • T is of the form I<T1, ..., Tn > and S is of the form I <S1, ..., Sn>
///    and Ti << Si 1 <= i <= n.
///  • T and S are both function types, and T << S under the rules of section
///    (Types/Function Types).
///  • T is a function type and S is Function.
///  • T << U and U << S.
/// << is a partial order on types. T is a subtype of S, written T <: S, iff
/// [⊥/Dynamic]T << S.
/// . . .
/// An interface type T may be assigned to a type S, written T <=> S, if either
/// T <: S or S <: T.
/// @description Checks type test and assignment for a class type extending
/// parameterized class type.
/// @author iefremov

import "../../../Utils/expect.dart";

class G<T> {}
class NonGeneric extends G<int> {}

// these produce the required static type for static checker
// but won't fail at run time because they return null after all
G? makeG() {}
G<int>? makeGint() {}

main() {
  Expect.isTrue(new NonGeneric() is G);
  Expect.runtimeIsType<G>(new NonGeneric());
  G? g4 = makeG();
  G g4_ = new NonGeneric();

  Expect.isTrue(new NonGeneric() is G<int>);
  Expect.runtimeIsType<G<int>>(new NonGeneric());
  G<int>? g5 = makeGint();
  G<int> g5_ = new NonGeneric();
}
