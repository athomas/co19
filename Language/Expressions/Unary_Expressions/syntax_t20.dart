// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Unary expressions invoke unary operators on objects.
/// unaryExpression:
///   preﬁxOperator unaryExpression |
///   awaitExpression |
///   postﬁxExpression |
///   (minusOperator | tildeOperator) super |
///   incrementOperator assignableExpression
/// ;
/// preﬁxOperator:
///   minusOperator |
///   negationOperator |
///   tildeOperator
/// ;
/// minusOperator:
///   ‘-’ |
/// ;
/// negationOperator:
///   ‘!’ |
/// ;
/// tildeOperator:
///   ‘˜’
/// ;
/// A unary expression is either a postfix expression, an await expression or
/// an invocation of a prefix operator on an expression or an invocation of a
/// unary operator on either super or an expression e.
/// @description Checks that '-' cannot be used with
/// a reference to a type parameter without a compile error.
/// @author msyabro


class A <T> {
  test() {
    -T;
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  A a = new A();
  a.test();
}
