// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If an unmigrated library re-exports a migrated library, the
/// re-exported symbols retain their migrated status (that is, downstream
/// migrated libraries will see their migrated types).
/// @description Check that if generic function with non-nullable type parameter
/// is exported from opted-in library to legacy library and then back to the
/// opted in code, it retains its status.
/// @author iarkh@unipro.ru

// Requirements=nnbd-weak

import "../../../Utils/expect.dart";
import "exports_A01_opted_out_lib.dart";

main() {
  Expect.isTrue(testGenericInt is void Function<T extends int>());
  Expect.isTrue(testGenericFunction is void Function<T extends Function>());
  Expect.isTrue(testGenericObject is void Function<T extends Object>());
  Expect.runtimeIsType<void Function<T extends int>()>(testGenericInt);
  Expect.runtimeIsType<void Function<T extends Function>()>(testGenericFunction);
  Expect.runtimeIsType<void Function<T extends Object>()>(testGenericObject);
}
