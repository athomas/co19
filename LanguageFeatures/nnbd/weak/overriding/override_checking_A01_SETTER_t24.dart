// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In an unmigrated library, override checking is done using legacy
/// types. This means that an unmigrated library can bring together otherwise
/// incompatible methods. When choosing the most specific signature during
/// interface computation, all nullability and requiredness annotations are
/// ignored, and the [Never] type is treated as [Null].
///
/// @description Check that if legacy class extends legacy class and implements
/// opted-in class, legacy setter can accept non-null values if corresponding
/// parent setter is of the [Never] type.
///
/// @author iarkh@unipro.ru

// Requirements=nnbd-weak
// @dart=2.6

import "dart:async";
import "../../../../Utils/expect.dart";
import "override_checking_A01_opted_in_lib.dart";

void testme1() {}

class A1 extends B1 implements OPTED_NEVER_SETTER {}
class B1 {
  void set setNever(int i) { Expect.equals(1, i); }
}

class A2 extends B2 implements OPTED_NEVER_SETTER {}
class B2 {
  void set setNever(dynamic d) { Expect.equals(1, d); }
}

class A3 extends B3 implements OPTED_NEVER_SETTER {}
class B3 {
  void set setNever(Object o) { Expect.equals(1, o); }
}

class A4 extends B4 implements OPTED_NEVER_SETTER {}
class B4 {
  void set setNever(FutureOr f) { Expect.equals(1, f); }
}

class A5 extends B5 implements OPTED_NEVER_SETTER {}
class B5 {
  void set setNever(Function f) { Expect.equals(testme1, f); }
}

main() {
  A1().setNever = 1;
  A2().setNever = 1;
  A3().setNever = 1;
  A4().setNever = 1;
  A5().setNever = testme1;
}
