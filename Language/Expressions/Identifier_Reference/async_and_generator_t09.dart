// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if either of the identifiers [await] or
/// [yield] is used as an identifier in a function body marked with either
/// [async], [async*] or [sync*].
/// @description Checks that it is a compile-time error if await is used in the
/// method marked with sync*.
/// @author ngl@unipro.ru


f() sync* {
  int await = 2;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  f();
}

