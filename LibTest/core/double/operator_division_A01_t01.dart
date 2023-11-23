// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion double operator /(num other)
/// @description Checks that if one of the operands is a NaN the result is a NaN.
/// @author pagolubev

import "../../../Utils/expect.dart";

final List<double> values = const [
   -1/0,
   -1.7976931348623157e308,
   -3.273390607896142E150,
   -4.503599627370497E15,
   -4.503599627370496E15,
   -4.5035996273704955E15,
   -4.294967296000001E9,
   -4.294967296E9,
   -4.2949672959999995E9,
   -6031769.5,
   -101.0,
   -100.00000000000001,
   -100.0,
   -99.99999999999999,
   -99.0,
   -10.0,
   -1.0000000000000002,
   -1.0,
   -.9999999999999999,
   -.7,
   -2.2250738585072014e-308,
   -4.9406564584124654e-324,
   .0,
   4.9406564584124654e-324,
   2.2250738585072014e-308,
   .7, .9999999999999999,
   1.0,
   1.0000000000000002,
   10.0,
   99.0,
   99.99999999999999,
   100.0,
   100.00000000000001,
   101.0,
   6031769.5,
   4.2949672959999995E9,
   4.294967296E9,
   4.294967296000001E9,
   4.5035996273704955E15,
   4.503599627370496E15,
   4.503599627370497E15,
   3.273390607896142E150,
   1.7976931348623157e308,
   1/0,
   double.nan
];

checkNaN(d) {
  var msg = 'Expected: NaN, actual: $d';
  Expect.isTrue(d.isNaN, msg);
}

main() {
  values.forEach((d) {
    checkNaN(d / double.nan);
    checkNaN(double.nan / d);
  });
}
