// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The [==] operator in constant expressions was defined such that
/// [e1 != null] was only allowed if [e1] had one of the "primitive" system
/// types. Users had to rewrite their code to [!identical(e1, null)]. This was
/// changed so that the [==] expression is always allowed as long as one of the
/// operands is [null].
/// @description Checks that compile-time exception is thrown if one of the [!=]
/// operand is [null] and another one is not a potentially constant.
/// @author iarkh@unipro.ru


class A {}
A? a = A();

class B {
  final String option;
  const B(String str) : option = a != null ? str : "a";
//                               ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
}
