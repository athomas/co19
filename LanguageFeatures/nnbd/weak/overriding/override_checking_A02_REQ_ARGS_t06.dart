// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In a migrated library, override checking must check that an
/// override is consistent with all overridden methods from other migrated
/// libraries in the super-interface chain, since a legacy library is permitted
/// to override otherwise incompatible signatures for a method.
///
/// @description Check that if opted-in class is a mixin with a legacy class,
/// migrated method with non-required nullable parameter can override legacy
/// method with named parameter with default value.
///
/// @author iarkh@unipro.ru

// Requirements=nnbd-weak
import "override_checking_A02_opted_out_lib.dart";

class A1 with LEGACY_REQUIRED_ARGS {
  void test_default({int? i = 1}) {}
}

abstract class A2 with LEGACY_REQUIRED_ARGS {
  void test_default({int? i = 1});
}

main() {
  A1().test_default(i: 1);
}
