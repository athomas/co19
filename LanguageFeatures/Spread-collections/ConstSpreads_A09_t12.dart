// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion From the Unified collection Spec:
/// A spreadElement starting with [...] is a constant element if its expression
/// is constant and it evaluates to a constant List, Set or Map instance
/// originally created by a list, set or map literal. It is a potentially
/// constant element if the expression is a potentially constant expression.
/// @description: Checks that compile time error is thrown if constant set spread
/// element is not a potentially constant list or set.
/// @author iarkh@unipro.ru

class A {
  const A();
}

main() {
  const Set aSet = {...(A() is A ? 123 : [])};
//                     ^
// [analyzer] unspecified
// [cfe] unspecified
}
