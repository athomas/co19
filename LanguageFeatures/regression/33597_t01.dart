// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Regression test for the Issue 33597 (Dartanalyzer does not throw
/// compiler error when function variable with incorrect return type parameter is
/// declared): Checks that parameter type is checked correctly for functions.
/// @Issue 33597
/// @author iarkh@unipro.ru

typedef F<X extends int> = X Function();
F<List>?  myvariable;
//^
// [analyzer] unspecified
// [cfe] unspecified
main() {}
