// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If an unmigrated library re-exports a migrated library, the
/// re-exported symbols retain their migrated status (that is, downstream
/// migrated libraries will see their migrated types).
/// @description Check that if function with non-nullable argument is exported
/// from opted-in library to legacy library and then back to the opted in code,
/// it retains its status and can accept non-null arguments.
/// @author iarkh@unipro.ru

// Requirements=nnbd-weak

import "dart:async";
import "../../../Utils/expect.dart";
import "exports_A01_opted_out_lib.dart";

main() {
  Expect.isTrue(test_int_arg is void Function(int));
  Expect.runtimeIsType<void Function(int)>(test_int_arg);
  test_int_arg(1);

  Expect.isTrue(test_object_arg is void Function(Object));
  Expect.runtimeIsType<void Function(Object)>(test_object_arg);
  test_object_arg(1);

  Expect.isTrue(test_function_arg is void Function(Function));
  Expect.runtimeIsType<void Function(Function)>(test_function_arg);
  test_function_arg(testme);

  Expect.isTrue(test_futureOrInt_arg is void Function(FutureOr<int>));
  Expect.runtimeIsType<void Function(FutureOr<int>)>(test_futureOrInt_arg);
  test_futureOrInt_arg(1);
}
