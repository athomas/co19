// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define inherited(J, K) to be
/// the set of members m such that all of the following hold:
/// • m is accessible to K and
/// • A is a direct superinterface of J and either
/// – A declares a member m or
/// – m is a member of inherited(A, K).
/// • m is not overridden by J.
/// ...
/// Otherwise, if the static types T1,...,Tk of the members m1,...,mk are not
/// identical, then there must be a member mx such that Tx <: Ti, 1 ≤ x ≤ k for
/// all i ∈ 1..k, or a static type warning occurs. The member that is inherited
/// is mx, if it exists; otherwise: let numberOf P ositionals(f) denote the
/// number of positional parameters of a function f, and let numberOf
/// RequiredParams(f) denote the number of required parameters of a function f.
/// Furthermore, let s denote the set of all named parameters of the m1,...,mk.
/// Then let
/// h = max(numberOf Positionals(mi)),
/// r = min(numberOf RequiredParams(mi)), i ∈ 1..k.
/// Then I has a method named n, with r required parameters of type dynamic,
/// h positional parameters of type dynamic, named parameters s of type dynamic
/// and return type dynamic.
/// @description Checks that there's a compile-error if two members with the same
/// name but different number of arguments are inherited
/// @author rodionov

abstract class SI1 {
  void foo(var v);
}

abstract class SI2 {
  void foo(var v, var vv);
}

typedef SIAlias1 = SI1;
typedef SIAlias2 = SI2;

abstract class I implements SIAlias1, SIAlias2 {}
//             ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  I? i = null;
}
