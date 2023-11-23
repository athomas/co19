// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In an unmigrated library, override checking is done using legacy
/// types. This means that an unmigrated library can bring together otherwise
/// incompatible methods. When choosing the most specific signature during
/// interface computation, all nullability and requiredness annotations are
/// ignored, and the [Never] type is treated as [Null].
///
/// @description Check that if legacy class extends opted-in class, legacy setter
/// can accept [null] values if corresponding parent setter is of non-nullable
/// type.
///
/// @author iarkh@unipro.ru

// Requirements=nnbd-weak
// @dart=2.6

import "dart:async";
import "../../../../Utils/expect.dart";
import "override_checking_A01_opted_in_lib.dart";

class A extends OPTED_NONNULLABLE_SETTER {
  void set setInt(int i)                   { Expect.isNull(i); }
  void set setObject(Object o)             { Expect.isNull(o); }
  void set setFunction(Function f)         { Expect.isNull(f); }
  void set setFutureOrInt(FutureOr<int> i) { Expect.isNull(i); }
}

main() {
  A a = A();

  a.setInt         = null;
  a.setObject      = null;
  a.setFutureOrInt = null;
  a.setFunction    = null;
}
