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
/// legacy field can accept null values if corresponding parent field is of
/// nullable type.
///
/// @author iarkh@unipro.ru

// Requirements=nnbd-weak
// @dart=2.6

import "dart:async";
import "../../../../Utils/expect.dart";
import "override_checking_A01_opted_in_lib.dart";

class A with OPTED_NULLABLE_FIELD {
  int i = null;
  Object o = null;
  dynamic d = null;
  Function f = null;
  Null n = null;
  FutureOr fo = null;
  void v = null;
}

main() {
  A a = A();
  Expect.isNull(a.i);
  Expect.isNull(a.o);
  Expect.isNull(a.f);
  Expect.isNull(a.d);
  Expect.isNull(a.n);
  Expect.isNull(a.fo);
}
