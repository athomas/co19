// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If an unmigrated library re-exports a migrated library, the
/// re-exported symbols retain their migrated status (that is, downstream
/// migrated libraries will see their migrated types).
/// @description Check that nullable type alias exported from opted-in library to
/// legacy library and then back to the opted in code retains its status.
/// @author iarkh@unipro.ru

// Requirements=nnbd-weak

import "dart:async";
import '../../../Utils/expect.dart';
import 'exports_A01_opted_out_aliases_lib.dart';

typedef exp_A                                              = A?         ;
typedef exp_Int                                            = int?       ;
typedef exp_Function                                       = Function?  ;
typedef exp_Object                                         = Object?    ;
typedef exp_Dynamic                                        = dynamic    ;
typedef exp_Null                                           = Null       ;
typedef exp_FutureOr                                       = FutureOr   ;
typedef exp_FutureOrFutureOr<T extends FutureOr<FutureOr>> = FutureOr<T>;

main() {
  Expect.equals(typeOf<exp_A>(),                typeOf<NullableAAlias>()       );
  Expect.equals(typeOf<exp_Int>(),              typeOf<NullableIntAlias>()     );
  Expect.equals(typeOf<exp_Function>(),         typeOf<NullableFunctionAlias>());
  Expect.equals(typeOf<exp_Object>(),           typeOf<NullableObjectAlias>()  );
  Expect.equals(typeOf<exp_Dynamic>(),          typeOf<DynamicAlias>()         );
  Expect.equals(typeOf<exp_Null>(),             typeOf<NullAlias>()            );
  Expect.equals(typeOf<exp_FutureOr>(),         typeOf<FutureOrAlias>()        );
  Expect.equals(typeOf<exp_FutureOrFutureOr>(), typeOf<FutureOrFutureOrAlias>());
}
