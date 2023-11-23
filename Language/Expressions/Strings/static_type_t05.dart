// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The static type of a string literal is String.
/// @description Checks that a compile error occurs when assigning
/// a raw single-quoted string literal to an int variable.
/// @author msyabro


main() {
  int i = r'string';
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}
