// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In an unmigrated library, override checking is done using legacy
/// types. This means that an unmigrated library can bring together otherwise
/// incompatible methods. When choosing the most specific signature during
/// interface computation, all nullability and requiredness annotations are
/// ignored, and the [Never] type is treated as [Null].
///
/// @description Check that if legacy class implements opted-in class, child
/// class type parameter can be [Null] if parent class type parameter is [Never].
///
/// @Issue 40389
/// @author iarkh@unipro.ru

// Requirements=nnbd-weak
// @dart=2.6

import "../../../../Utils/expect.dart";
import "override_checking_A01_opted_in_lib.dart";

class A<T extends Null> implements OPTED_NEVER<T> { dynamic getParamType() => typeOf<T>(); }

main() {
  Expect.equals(Null, A().getParamType());
  Expect.equals(Null, A<Null>().getParamType());
}
