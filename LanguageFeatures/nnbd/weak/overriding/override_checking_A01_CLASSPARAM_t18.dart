// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In an unmigrated library, override checking is done using legacy
/// types. This means that an unmigrated library can bring together otherwise
/// incompatible methods. When choosing the most specific signature during
/// interface computation, all nullability and requiredness annotations are
/// ignored, and the [Never] type is treated as [Null].
///
/// @description Check that if generic legacy class implements generic opted-in
/// class, legacy type parameter can be [Null] if parent class type parameter is
/// nullable [FutureOr].
///
/// @Issue 39666.
/// @author iarkh@unipro.ru

// Requirements=nnbd-weak
// @dart=2.6

import "dart:async";
import "../../../../Utils/expect.dart";
import "override_checking_A01_opted_in_futureor_lib.dart";

class A1<T extends Null> implements OPTED_FUTUREOR<T>          { dynamic getParamType() => typeOf<T>(); }
class A2<T extends Null> implements OPTED_FUTUREOR_FUTUREOR<T> { dynamic getParamType() => typeOf<T>(); }

main() {
  Expect.equals( Null, A1().getParamType());
  Expect.equals( Null, A1<Null>().getParamType());

  Expect.equals( Null, A2().getParamType());
  Expect.equals( Null, A2<Null>().getParamType());
}
