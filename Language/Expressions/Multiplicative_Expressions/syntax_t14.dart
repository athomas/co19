// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Multiplicative expressions invoke the multiplication operators on
/// objects.
/// multiplicativeExpression:
///   unaryExpression (multiplicativeOperator unaryExpression)* |
///   super (multiplicativeOperator unaryExpression)+
/// ;
/// multiplicativeOperator:
///   '*' |
///   '/' |
///   '%' |
///   '~/'
/// ;
/// A multiplicative expression is either a unary expression, or an invocation
/// of a multiplicative operator on either super or an expression e1, with
/// argument e2.
/// @description Checks that reference to a function type alias name cannot be
/// used as the left operand of a multiplicative expression without a compile
/// error.
/// @author msyabro


typedef int f();

main() {
  f * 1;
//  ^
// [analyzer] unspecified
// [cfe] unspecified
}
