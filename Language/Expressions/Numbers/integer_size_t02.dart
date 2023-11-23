// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Evaluating a hexadecimal integer literal with numeric value i is a
/// compile-time error unless -2^63 <= i <= 2^64
/// @description Checks that it is a compile error if a hexadecimal integer
/// literal with numeric value less than -2^63
/// @author sgrekhov@unipro.ru


main() {
  int i = 0x80000000000000000;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}
