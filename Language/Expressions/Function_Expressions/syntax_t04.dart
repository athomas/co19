// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A function literal is an object that encapsulates an executable
/// unit of code.
/// functionExpression:
///   formalParameterList functionExpressionBody
/// ;
/// @description Checks that the parameter list is required in the form
/// ['=>' expression ';'].
/// @author msyabro


main() {
  var func =  => 1;
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}
