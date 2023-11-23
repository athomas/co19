// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Finally, the conditional [?]/[:] operator only evaluates one of
/// its branches, depending on whether the condition expression evaluates to
/// [true] or [false]. The other branch must also be a potentially constant
/// expression.
/// @description Checks that compile error is thrown if condition of conditional
/// operator [?]/[:] is [true] and the second one is not a constant expression.
/// @author iarkh@unipro.ru


main() {
  String? s1;
  const String? str1 = true ? "OK" : s1;
//                                   ^
// [analyzer] unspecified
// [cfe] unspecified

  String s2 = "testme";
  const String str2 = true ? "OK" : s2;
//                                  ^^
// [analyzer] unspecified
// [cfe] unspecified

  var i = 9;
  const String str3 = true ? "OK" : i;
//                                  ^
// [analyzer] unspecified
// [cfe] unspecified

  dynamic j = 9;
  const String str4 = true ? "OK" : j;
//                                  ^
// [analyzer] unspecified
// [cfe] unspecified

}
