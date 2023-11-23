// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In an unmigrated library, override checking is done using legacy
/// types. This means that an unmigrated library can bring together otherwise
/// incompatible methods. When choosing the most specific signature during
/// interface computation, all nullability and requiredness annotations are
/// ignored, and the [Never] type is treated as [Null].
///
/// @description Check that if generic legacy class extends legacy class and
/// implements generic opted-in class with [FutureOr] class type parameter,
/// legacy type parameter is OK and the fact that parent interface type parameter
/// is non-nullable is ignored.
///
/// @Issue 39666.
/// @author iarkh@unipro.ru

// Requirements=nnbd-weak
// @dart=2.6

import "dart:async";
import "../../../../Utils/expect.dart";
import "override_checking_A01_opted_in_futureor_lib.dart";

class B<T> { dynamic getParamType() => typeOf<T>(); }
class A<T extends FutureOr<int>> extends B<T> implements OPTED_FUTUREOR_INT<T> {}

main() {
  Expect.equals( typeOf<FutureOr<int>>(), A().getParamType());
  Expect.equals( int, A<int>().getParamType());
}
