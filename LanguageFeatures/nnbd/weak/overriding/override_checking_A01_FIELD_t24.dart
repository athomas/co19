// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In an unmigrated library, override checking is done using legacy
/// types. This means that an unmigrated library can bring together otherwise
/// incompatible methods. When choosing the most specific signature during
/// interface computation, all nullability and requiredness annotations are
/// ignored, and the [Never] type is treated as [Null].
///
/// @description Check that if legacy class extends opted-in class, legacy field
/// can be [Null] if corresponding parent field cannot be of any type but [Never].
///
/// @author iarkh@unipro.ru

// Requirements=nnbd-weak
// @dart=2.6

import "override_checking_A01_opted_in_lib.dart";

class A1 with OPTED_NEVER_FIELD {
  int n;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

class A2 with OPTED_NEVER_FIELD {
  dynamic n;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

class A3 with OPTED_NEVER_FIELD {
  Object n;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
}

class A4 with OPTED_NEVER_FIELD {
  void n;
//     ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  A1();
  A2();
  A3();
  A4();
}
