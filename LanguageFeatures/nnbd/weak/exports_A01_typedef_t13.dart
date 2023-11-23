// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If an unmigrated library re-exports a migrated library, the
/// re-exported symbols retain their migrated status (that is, downstream
/// migrated libraries will see their migrated types).
/// @description Check that if generic function typedef with non-nullable type
/// parameter is exported from opted-in library to legacy library and then back
/// to the opted in code, typedef retains its status. Typedef is in the form
/// [typedef <typeIdentifier> <typeParameters> = <functionType>]. Check function
/// with argument.
/// @author iarkh@unipro.ru

// Requirements=nnbd-weak

import "../../../Utils/expect.dart";
import "exports_A01_opted_out_lib.dart";

typedef exp_int     <T extends int     > = void Function(T);
typedef exp_object  <T extends Object  > = void Function(T);
typedef exp_function<T extends Function> = void Function(T);

main() {
  Expect.equals(exp_int,      g_def_int_arg     );
  Expect.equals(exp_object,   g_def_object_arg  );
  Expect.equals(exp_function, g_def_function_arg);
}
