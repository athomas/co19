// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if the unbounded integer value of a
/// double valued integer literal cannot be represented exactly as an IEEE 754
/// double-precision value, assuming that the mantissa is extended with zeros
/// until the precision is sufficiently high to unambiguously specify a single
/// integer value.
/// @description Checks that it is not a compile-time error if the unbounded
/// integer value of a double valued integer literal with binary representation
/// of 54 bit length can be represented exactly as an IEEE 754 double-precision
/// value (if the most significant bit is 1 and the low bit is 0).
/// @author ngl@unipro.ru


main() {
  double d1 = 0x20000000000000;
  double d2 = 0x20000000000002;
  double d3 = 0x20000000000004;
  double d4 = 0x20000000000006;
}
