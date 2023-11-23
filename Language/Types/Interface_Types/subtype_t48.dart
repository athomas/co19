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
/// @description Checks that if T and S are both function types and T << S then
/// the interface type T << the interface type S.
/// @author ilya

import "../../../Utils/expect.dart";

typedef void F1(int i, String s, [int p]);
typedef void F2(int i, String s, {int n});

class Whatever {}

main() {
  void f11(int i, String s, [int p = 0]) {}
  Expect.isTrue(f11 is F1);
  Expect.runtimeIsType<F1>(f11);

  int f12 (int i, String s, [int p = 0]) => 42;
  Expect.isTrue(f12 is F1);
  Expect.runtimeIsType<F1>(f12);

  int f13 (int i, [String s = "", int p = 0]) => 42;
  Expect.isTrue(f13 is F1);
  Expect.runtimeIsType<F1>(f13);

  int f14 (int i, [String s = "", int p = 0, Whatever? w]) => 42;
  Expect.isTrue(f14 is F1);
  Expect.runtimeIsType<F1>(f14);

  void f21(int i, String s, {int n = 42}) {}
  Expect.isTrue(f21 is F2);
  Expect.runtimeIsType<F2>(f21);

  void f22(int i, String s, {int n = 42}) {}
  Expect.isTrue(f22 is F2);
  Expect.runtimeIsType<F2>(f22);

  int f23 (int i, String s, {int n = 4, int n2 = 2}) => 42;
  Expect.isTrue(f23 is F2);
  Expect.runtimeIsType<F2>(f23);

  int f24 (int i, String s, {int n = 42, Whatever? w}) => 42;
  Expect.isTrue(f24 is F2);
  Expect.runtimeIsType<F2>(f24);
}
