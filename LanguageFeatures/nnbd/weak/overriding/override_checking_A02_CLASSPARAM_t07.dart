// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In a migrated library, override checking must check that an
/// override is consistent with all overridden methods from other migrated
/// libraries in the super-interface chain, since a legacy library is permitted
/// to override otherwise incompatible signatures for a method.
///
/// @description Check that if generic opted-in class implements generic legacy
/// class, child opted-in class type parameter can extend nullable type.
///
/// @author iarkh@unipro.ru

// Requirements=nnbd-weak
import "../../../../Utils/expect.dart";
import "override_checking_A02_opted_out_lib.dart";

class Opted<T> implements LEGACY_CLASS<T> {
  dynamic getParamType() => typeOf<T>();
}

class OptedInt<T extends int?> implements LEGACY_CLASS_INT<T> {
  dynamic getParamType() => T;
}

class OptedObject<T extends Object?> implements LEGACY_CLASS_OBJECT<T> {
  dynamic getParamType() => T;
}

class OptedFunction<T extends Function?> implements LEGACY_CLASS_FUNCTION<T> {
  dynamic getParamType() => T;
}

class OptedNull<T extends Null> implements LEGACY_CLASS_NULL<T> {
  dynamic getParamType() => T;
}

main() {
  Expect.equals(typeOf<dynamic>(), Opted().getParamType());
  Expect.equals(typeOf<dynamic>(), Opted<dynamic>().getParamType());

  Expect.equals(typeOf<int?>(), OptedInt().getParamType());
  Expect.equals(typeOf<int?>(), OptedInt<int?>().getParamType());

  Expect.equals(typeOf<Object?>(), OptedObject().getParamType());
  Expect.equals(typeOf<Object?>(), OptedObject<Object?>().getParamType());

  Expect.equals(typeOf<Function?>(), OptedFunction().getParamType());
  Expect.equals(typeOf<Function?>(), OptedFunction<Function?>().getParamType());
}
