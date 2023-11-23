// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion From the Constant-update-2018 Spec:
/// The operator [>>>] is now allowed in a potentially constant expression, and
/// it is valid in constant expression if its left and right operands are [int]
/// instances, and the operation doesn't throw. The [>>>] operator has not been
/// added to the [int] class yet, so unless the left-hand operand's static type
/// is [dynamic], the program will still be rejected. When the operator is added,
/// it should then also work in a constant expression.
/// @description Checks that arguments of [>>>] operator should be int.
/// @author iarkh@unipro.ru


const d0 = 2;
const d1 = 14;
const d2 = 11.43;
const d3 = "testme";
const d4 = null;

class MyClass {
  final int a;
  const MyClass(i1, i2) : a = (i1 >>> i2);
}

main() {
  const MyClass c1 = MyClass(d2, d1);
//                   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const MyClass c2 = MyClass(d2, 2);
//                   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const MyClass c3 = MyClass(d3, d0);
//                   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const MyClass c4 = MyClass(12, d4);
//                   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const MyClass c5 = MyClass(d4, d3);
//                   ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
