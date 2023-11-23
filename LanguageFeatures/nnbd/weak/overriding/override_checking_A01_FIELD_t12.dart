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
/// field can be unassigned when corresponding parent field is of nullable type.
///
/// @author iarkh@unipro.ru

// Requirements=nnbd-weak
// @dart=2.6

import "dart:async";
import "../../../../Utils/expect.dart";
import "override_checking_A01_opted_in_lib.dart";

class A implements OPTED_NULLABLE_FIELD {
  int i;
  Object o;
  dynamic d;
  Function f;
  Null n;
  FutureOr fo;
  void v;
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
