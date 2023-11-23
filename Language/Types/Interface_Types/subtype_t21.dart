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
/// @description Checks that GenericType<T> is a subtype of GenericType<S> where
/// T and S are trivial generics.
/// @author iefremov

import "../../../Utils/expect.dart";

class I {}
class J extends I {}
class K extends J {}
class L extends K {}

// subtypes of each other, according to (Types/Function Types)
typedef J f(List<num> l, [J i]);
typedef I f_1(List<int> l, [I i]);
typedef K f_2(List<int> l, [L i]);

main() {
  Expect.isTrue(new List<List>.empty() is List);
  Expect.runtimeIsType<List>(new List<List>.empty());
  Expect.isFalse(new List<List>.empty() is List<List<List>>);
  Expect.runtimeIsNotType<List<List<List>>>(new List<List>.empty());
  Expect.isFalse(new List<List>.empty() is List<List<List<List>>>);
  Expect.runtimeIsNotType<List<List<List<List>>>>(new List<List>.empty());
  Expect.isTrue(new List<List<List<List>>>.empty() is List<List<List>>);
  Expect.runtimeIsType<List<List<List>>>(new List<List<List<List>>>.empty());
  Expect.isTrue(new List<List<List<List>>>.empty() is List);
  Expect.runtimeIsType<List>(new List<List<List<List>>>.empty());

  Expect.isTrue(new List<Map<int, double>>.empty() is List<Map>);
  Expect.runtimeIsType<List<Map>>(new List<Map<int, double>>.empty());
  Expect.isTrue(new List<Map<int, double>>.empty() is List<Map<num, num>>);
  Expect.runtimeIsType<List<Map<num, num>>>(new List<Map<int, double>>.empty());

  Expect.isTrue(new List<f>.empty() is List<f>);
  Expect.runtimeIsType<List<f>>(new List<f>.empty());
  Expect.isFalse(new List<f_1>.empty() is List<f>);
  Expect.runtimeIsNotType<List<f>>(new List<f_1>.empty());
  Expect.isFalse(new List<f_2>.empty() is List<f>);
  Expect.runtimeIsNotType<List<f>>(new List<f_2>.empty());
}
