// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Unless explicitly stated otherwise, all ordinary rules that apply
/// to methods apply to abstract methods.
/// It is a compile error if an instance method m1 overrides an instance member
/// m2 and m1 has a greater number of required parameters than m2.
/// @description Checks that a compile error is produced when a non-abstract
/// instance method overrides an abstract method with the same name and greater
/// number of required parameters.
/// @author rodionov


abstract class A {
  f(var x);
}

class C extends A {
  f(var x, var y) {}
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  new C().f(2);
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified

  new C().f(2, 2);
}
