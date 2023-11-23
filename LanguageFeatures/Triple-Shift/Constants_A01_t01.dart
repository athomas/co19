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
/// @description Checks that operator [>>>] is accepted in potentially constant
/// expressions.
/// @Issue 30886
/// @author iarkh@unipro.ru

import "../../Utils/expect.dart";

class MyClass {
  final int a;
  const MyClass(int i1, int i2) : a = (i1 >>> i2);
}

main() {
  const x = 12345;

  const MyClass c1 = MyClass(-2, 1);
  Expect.equals(-2 >>> 1, c1.a);

  const MyClass c2 = MyClass(125, 2);
  Expect.equals(125 >>> 2, c2.a);

  const MyClass c3 = MyClass(x, 1000);
  Expect.equals(x >>> 1000, c3.a);

  const MyClass c4 = MyClass(4, 1);
  Expect.equals(4 >>> 1, c4.a);

  const MyClass c5 = MyClass(0, x);
  Expect.equals(0 >>> x, c5.a);

  const MyClass c6 = MyClass(1, 0);
  Expect.equals(1 >>> 0, c6.a);
}
