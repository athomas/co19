// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile time error if the expression is not one of the
/// following:
///   • A reference to a compile-time constant variable.
///   • A call to a constant constructor.
/// @description Check that if false is used as metadata, then
/// a compile time error is raised
/// @author a.semenov@unipro.ru

  @false
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
class A {}

main() {
  A? a;
}
