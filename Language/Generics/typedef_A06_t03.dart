// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A generic type alias is a declaration [D] of one of the following
/// forms:
///   m typedef id<X1 extends B1, . . . , Xs extends Bs> = T;
///   ...
/// Under the assumption that X1, . . . , Xs are types such that Xj <: Bj, for
/// all j ∈ 1..s, it is a compile-time error if [T] is not regular-bounded, and
/// it is a compile-time error if any type occurring in [T] is not well-bounded.
/// @description Checks that it is not a compile time error in the difficult
/// ([X extends A<X>]) type parameter cases.
/// @Issue 36870, 42434
/// @author iarkh@unipro.ru


class A<X extends A<X>> {}
typedef AAlias<X> = Function<X1 extends A<X>> ();
//                                        ^
// [analyzer] unspecified
// [cfe] unspecified

main() {}
