// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In a migrated library, override checking must check that an
/// override is consistent with all overridden methods from other migrated
/// libraries in the super-interface chain, since a legacy library is permitted
/// to override otherwise incompatible signatures for a method.
///
/// @description Check that if opted-in class extends legacy class, migrated
/// non-abstract method with non-required non-nullable parameter cannot override
/// legacy method with named parameter (which is nullable) with default value.
///
/// @author iarkh@unipro.ru

// Requirements=nnbd-weak
import "override_checking_A02_opted_out_lib.dart";

abstract class A extends LEGACY_REQUIRED_ARGS {
  void test_default({int i}) {}
//     ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class B extends A {}

main() {
  B().test_default(i: 1);
}
