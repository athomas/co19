// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a redirecting factory constructor
/// redirects to itself, either directly or indirectly via a sequence of
/// redirections.
/// @description Checks that compile-error occurs when factory constructor
/// redirects to itself.
/// @author ilya


class F {
  factory F() = F;
//              ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  new F();
}
