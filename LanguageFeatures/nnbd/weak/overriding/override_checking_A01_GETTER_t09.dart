// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In an unmigrated library, override checking is done using legacy
/// types. This means that an unmigrated library can bring together otherwise
/// incompatible methods. When choosing the most specific signature during
/// interface computation, all nullability and requiredness annotations are
/// ignored, and the [Never] type is treated as [Null].
///
/// @description Check that if legacy class implements opted-in class, legacy
/// getter can return non-null values if corresponding parent getter is of
/// nullable type.
///
/// @author iarkh@unipro.ru

// Requirements=nnbd-weak
// @dart=2.6

import "dart:async";
import "../../../../Utils/expect.dart";
import "override_checking_A01_opted_in_lib.dart";

void testme1() {}

class A implements OPTED_NULLABLE_GETTER {
  int get getInt           => 1;
  Object get getObject     => 1;
  Function get getFunction => testme1;
  FutureOr get getFutureOr => 1;
  dynamic get getDynamic   => 1;
  Null get getNull         => null;
}

main() {
  A a = A();
  Expect.equals(1, a.getInt);
  Expect.equals(1, a.getObject);
  Expect.equals(testme1, a.getFunction);
  Expect.equals(1, a.getFutureOr);
  Expect.equals(1, a.getDynamic);
}
