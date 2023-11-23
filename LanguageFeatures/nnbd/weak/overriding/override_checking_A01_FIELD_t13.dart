// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In an unmigrated library, override checking is done using legacy
/// types. This means that an unmigrated library can bring together otherwise
/// incompatible methods. When choosing the most specific signature during
/// interface computation, all nullability and requiredness annotations are
/// ignored, and the [Never] type is treated as [Null].
///
/// @description Check that if legacy class is a mixin with opted-in class,
/// legacy field can accept non-null values if corresponding parent field is of
/// non-nullable type.
///
/// @author iarkh@unipro.ru

// Requirements=nnbd-weak
// @dart=2.6

import "dart:async";
import "../../../../Utils/expect.dart";
import "override_checking_A01_opted_in_lib.dart";

void testme1() {}

class A with OPTED_NONNULLABLE_FIELD {
  int i = 1;
  Object o = 1;
  Function f = testme1;
  FutureOr<int> fi = 1;
}

main() {
  A a = A();
  Expect.equals(1, a.i);
  Expect.equals(1, a.o);
  Expect.equals(testme1, a.f);
  Expect.equals(1, a.fi);
}
