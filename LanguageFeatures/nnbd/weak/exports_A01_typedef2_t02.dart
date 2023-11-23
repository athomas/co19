// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If an unmigrated library re-exports a migrated library, the
/// re-exported symbols retain their migrated status (that is, downstream
/// migrated libraries will see their migrated types).
/// @description Check that if nullable type alias exported from opted-in library
/// to legacy library and then back to the opted in code, its variable can be
/// assigned to non-null object.
/// @author iarkh@unipro.ru

// Requirements=nnbd-weak

import '../../../Utils/expect.dart';
import 'exports_A01_opted_out_aliases_lib.dart';

void testme() {}

main() {
  NullableAAlias        a = A()   ;
  NullableIntAlias      i = 0     ;
  NullableFunctionAlias f = testme;
  NullableObjectAlias   o = 1     ;
  DynamicAlias          d = "Hi!" ;
  FutureOrAlias         x = 4     ;
  FutureOrFutureOrAlias y = 5     ;

  Expect.isNotNull(a);
  Expect.isNotNull(i);
  Expect.isNotNull(f);
  Expect.isNotNull(o);
  Expect.isNotNull(d);
  Expect.isNotNull(x);
  Expect.isNotNull(y);
}
