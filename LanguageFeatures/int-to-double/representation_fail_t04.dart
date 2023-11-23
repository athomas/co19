// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if the unbounded integer value of a
/// double valued integer literal cannot be represented exactly as an IEEE 754
/// double-precision value, assuming that the mantissa is extended with zeros
/// until the precision is sufficiently high to unambiguously specify a single
/// integer value.
/// @description Checks that it is a compile-time error if the unbounded integer
/// value of a double valued integer literal with binary representation of 55 bit
/// length can not be represented exactly as an IEEE 754 double-precision value
/// (the most significant bit is 1 and two low bits are not 0).
/// @author ngl@unipro.ru


main() {
  double d1 = 0x40000000000001;
//            ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
// [web] unspecified
  double d2 = 0x40000000000002;
//            ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
// [web] unspecified
  double d3 = 0x40000000000003;
//            ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
// [web] unspecified
  double d4 = 0x40000000000005;
//            ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
// [web] unspecified
  double d5 = 0x40000000000006;
//            ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
// [web] unspecified
  double d6 = 0x40000000000007;
//            ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
// [web] unspecified
  double d7 = 0x40000000000009;
//            ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
// [web] unspecified
  double d8 = 0x4000000000000A;
//            ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
// [web] unspecified
  double d9 = 0x4000000000000B;
//            ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
// [web] unspecified
}
