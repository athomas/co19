// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Regression test for the Issue 33597 (Dartanalyzer does not throw
/// compiler error when function variable with incorrect return type parameter is
/// declared): Checks that parameter type is checked correctly for functions.
/// @Issue 35148, 35149
/// @author iarkh@unipro.ru

dynamic getint() => 1;
X testme<X>(X x) => getint();

main() {
  testme<int>("");
//            ^
// [analyzer] unspecified
// [cfe] unspecified
}

