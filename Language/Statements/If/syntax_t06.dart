// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The if statement allows for conditional execution of statements.
/// ifStatement:
///   if '(' expression ')' statement ( else statement)?
/// ;
/// @description Checks that it is a compile-time error if the statement does not
/// end with a semicolon.
/// @author vasya


main() {
  if (true) var foo = "foo"
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
}

