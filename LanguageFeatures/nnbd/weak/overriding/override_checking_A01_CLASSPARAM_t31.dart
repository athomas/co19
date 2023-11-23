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
/// implements generic opted-in class, legacy type parameter is OK and the fact
/// that parent opted-in interface type parameter is non-nullable is ignored.
///
/// @author iarkh@unipro.ru

// Requirements=nnbd-weak
// @dart=2.6

import "../../../../Utils/expect.dart";
import "override_checking_A01_opted_in_lib.dart";

class B1<T> { dynamic getParamType() => typeOf<T>(); }
class B2<T> { dynamic getParamType() => typeOf<T>(); }
class B3<T> { dynamic getParamType() => typeOf<T>(); }

class A1<T extends int     > extends B1<T> implements OPTED_NONNULLABLE_INT<T>      {}
class A2<T extends Object  > extends B2<T> implements OPTED_NONNULLABLE_OBJECT<T>   {}
class A3<T extends Function> extends B3<T> implements OPTED_NONNULLABLE_FUNCTION<T> {}

main() {
  Expect.equals(int, A1().getParamType());
  Expect.equals(int, A1<int>().getParamType());

  Expect.equals(Object, A2().getParamType());
  Expect.equals(Object, A2<Object>().getParamType());

  Expect.equals(Function, A3().getParamType());
  Expect.equals(Function, A3<Function>().getParamType());
}
