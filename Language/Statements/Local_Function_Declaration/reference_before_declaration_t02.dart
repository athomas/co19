// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion  It is a compile-time error to reference a local function
/// before its declaration.
/// @description Checks that it is a compile-error to reference a name of
/// local function in function expression invocation before its declaration,
/// but in outer scope.
/// @author ilya


main() {
  func();
//^
// [analyzer] unspecified
// [cfe] unspecified
  { void func() {} }
}
