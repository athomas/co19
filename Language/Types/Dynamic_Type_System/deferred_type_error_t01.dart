// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile time error if a deferred, malformed or
/// malbounded type is used in a subtype test
/// @description Checks that a compile error occurs if deferred type is used
/// in an explicit subtype test.
/// @author ngl@unipro.ru


import "../somelib1.dart" deferred as p;

class A {}

main() {
  A is p.C;
//     ^
// [analyzer] unspecified
// [cfe] unspecified
}
