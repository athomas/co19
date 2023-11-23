// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In an unmigrated library, override checking is done using legacy
/// types. This means that an unmigrated library can bring together otherwise
/// incompatible methods. When choosing the most specific signature during
/// interface computation, all nullability and requiredness annotations are
/// ignored, and the [Never] type is treated as [Null].
///
/// @description Check that if legacy class extends opted-in class, legacy method
/// can return non-null values if parent method return type is nullable.
///
/// @author iarkh@unipro.ru

// Requirements=nnbd-weak
// @dart=2.6

import "dart:async";
import "../../../../Utils/expect.dart";
import "override_checking_A01_opted_in_lib.dart";

void testme1() {}

class A extends OPTED_NULLABLE_RETURN {
  int getInt()           =>1;
  Object getObject()     => 1;
  Function getFunction() => testme1;
  FutureOr getFutureOr() => 1;
  dynamic getDynamic()   => 1;
}

main() {
  A a = A();

  Expect.equals(1, a.getInt());
  Expect.equals(1, a.getObject());
  Expect.equals(1, a.getFutureOr());
  Expect.equals(1, a.getDynamic());
  Expect.equals(testme1, a.getFunction());
}
