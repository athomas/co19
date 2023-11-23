// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If an unmigrated library re-exports a migrated library, the
/// re-exported symbols retain their migrated status (that is, downstream
/// migrated libraries will see their migrated types).
/// @description Check that if function typedef with argument of non-nullable
/// type is exported from opted-in library to legacy library and then back to the
/// opted in code, it retains its status. Typedef is in the form [typedef <type>
/// <identifier> <formalParameterPart>].
/// @author iarkh@unipro.ru

// Requirements=nnbd-weak

import "dart:async";
import "../../../Utils/expect.dart";
import "exports_A01_opted_out_lib.dart";

typedef exp_int_arg         = void Function(int i);
typedef exp_object_arg      = void Function(Object o);
typedef exp_function_arg    = void Function(Function f);
typedef exp_futureOrInt_arg = void Function(FutureOr<int> i);

main() {
  Expect.equals(exp_int_arg,         def1_int_arg);
  Expect.equals(exp_object_arg,      def1_object_arg);
  Expect.equals(exp_function_arg,    def1_function_arg);
  Expect.equals(exp_futureOrInt_arg, def1_futureOrInt_arg);
}
