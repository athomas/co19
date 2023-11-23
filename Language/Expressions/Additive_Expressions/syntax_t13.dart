// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Additive expressions invoke the addition operators on objects.
/// additiveExpression:
///   multiplicativeExpression (additiveOperator multiplicativeExpression)* |
///   super (additiveOperator multiplicativeExpression)+
/// ;
/// additiveOperator:
///   '+' |
///   '-'
/// ;
/// An additive expression is either a multiplicative expression, or an
/// invocation of an additive operator on either super or an expression e1, with
/// argument e2.
/// @description Checks that a type parameter can not be used
/// as left operand in an additive expression. It is a compile error.
/// @author msyabro


class A <T> {
  test() {
    try {
      T - 1;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    } catch (e) {}
  }
}

main() {
  A a = new A();
  a.test();
}
