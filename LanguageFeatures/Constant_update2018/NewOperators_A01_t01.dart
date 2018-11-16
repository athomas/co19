/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The operator [>>>] is now allowed in a potentially constant
 * expression, and it is valid in constant expression if its left and right
 * operands are [int] instances, and the operation doesn't throw. The [>>>]
 * operator has not been added to the [int] class yet, so unless the left-hand
 * operand's static type is [dynamic], the program will still be rejected. When
 * the operator is added, it should then also work in a constant expression.
 * @description Checks that operator [>>>] is accepted in a potentially constant
 * expressions.
 * @author iarkh@unipro.ru
 */
import "../../Utils/expect.dart";

class MyClass {
  final a;
  const MyClass(i1, i2) : a = (i1 >> i2);
}

main() {
  const MyClass c1 = MyClass(15, 1);
  Expect.equals((15 >> 1), c1.a);

  const MyClass c2 = MyClass(125, 2);
  Expect.equals(125 >> 2, c2.a);
}
