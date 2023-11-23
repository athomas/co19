// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In an unmigrated library, override checking is done using legacy
/// types. This means that an unmigrated library can bring together otherwise
/// incompatible methods. When choosing the most specific signature during
/// interface computation, all nullability and requiredness annotations are
/// ignored, and the [Never] type is treated as [Null].
///
/// @description Check that if legacy class is a mixin with opted-in class,
/// legacy method can accept non-null arguments if corresponding parent method
/// argument is of non-nullable type.
///
/// @author iarkh@unipro.ru

// Requirements=nnbd-weak
// @dart=2.6

import "dart:async";
import "../../../../Utils/expect.dart";
import "override_checking_A01_opted_in_lib.dart";

class A with OPTED_NONNULLABLE_ARGS {
  void test_int     (int           i) { Expect.equals(1, i); }
  void test_object  (Object        o) { Expect.equals(1, o); }
  void test_futureOr(FutureOr<int> i) { Expect.equals(1, i); }
  void test_function(Function      f) { Expect.equals(testme, f); }
}

void testme() {}

main() {
  A a = A();

  a.test_int     (1);
  a.test_object  (1);
  a.test_futureOr(1);
  a.test_function(testme);
}
