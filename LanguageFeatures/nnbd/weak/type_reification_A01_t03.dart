// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All types reified in legacy libraries are reified as legacy types.
/// @description Check that runtime type of the function imported from opted to
/// legacy library is a legacy type.
/// @author iarkh@unipro.ru

// Requirements=nnbd-weak

import "../../../Utils/expect.dart";
import "type_reification_legacy_lib.dart";

main() {
  Expect.isTrue(test1 is F1);
  Expect.isTrue(test2 is F1);
  Expect.isFalse(test3 is F1);
  Expect.runtimeIsType<F1>(test1);
  Expect.runtimeIsType<F1>(test2);
  Expect.runtimeIsNotType<F1>(test3);

  Expect.isTrue(test1 is F1?);
  Expect.isTrue(test2 is F1?);
  Expect.isFalse(test3 is F1?);
  Expect.runtimeIsType<F1?>(test1);
  Expect.runtimeIsType<F1?>(test2);
  Expect.runtimeIsNotType<F1?>(test3);

  Expect.isFalse(test1 is F2);
  Expect.isFalse(test2 is F2);
  Expect.isFalse(test3 is F2);
  Expect.runtimeIsNotType<F2>(test1);
  Expect.runtimeIsNotType<F2>(test2);
  Expect.runtimeIsNotType<F2>(test3);

  Expect.isFalse(test4 is F1);
  Expect.isFalse(test5 is F1);
  Expect.isFalse(test6 is F1);
  Expect.runtimeIsNotType<F1>(test4);
  Expect.runtimeIsNotType<F1>(test5);
  Expect.runtimeIsNotType<F1>(test6);

  Expect.isFalse(test4 is F1?);
  Expect.isFalse(test5 is F1?);
  Expect.isFalse(test6 is F1?);
  Expect.runtimeIsNotType<F1?>(test4);
  Expect.runtimeIsNotType<F1?>(test5);
  Expect.runtimeIsNotType<F1?>(test6);

  Expect.isFalse(test4 is F2);
  Expect.isFalse(test5 is F2);
  Expect.isTrue(test6 is F2);
  Expect.runtimeIsNotType<F2>(test4);
  Expect.runtimeIsNotType<F2>(test5);
  Expect.runtimeIsType<F2>(test6);

  Expect.isFalse(test4 is F2?);
  Expect.isFalse(test5 is F2?);
  Expect.isTrue(test6 is F2?);
  Expect.runtimeIsNotType<F2?>(test4);
  Expect.runtimeIsNotType<F2?>(test5);
  Expect.runtimeIsType<F2?>(test6);

  Expect.isTrue(test4 is F2<int, B, A1>);
  Expect.isTrue(test4 is F2<int?, B?, A1?>);
  Expect.isTrue(test4 is F2<int, B<Object?>, A1>);
  Expect.isTrue(test4 is F2<int, B<Object>, A1>);
  Expect.runtimeIsType<F2<int, B, A1>>(test4);
  Expect.runtimeIsType<F2<int?, B?, A1?>>(test4);
  Expect.runtimeIsType<F2<int, B<Object?>, A1>>(test4);
  Expect.runtimeIsType<F2<int, B<Object>, A1>>(test4);

  Expect.isTrue(test3 is F3<A1?>);
  Expect.runtimeIsType<F3<A1?>>(test3);

  Expect.isTrue(test7 is F4<int?>);
  Expect.isFalse(test7 is F4<String?>);
  Expect.runtimeIsType<F4<int?>>(test7);
  Expect.runtimeIsNotType<F4<String?>>(test7);

  Expect.isTrue(test7 is F4<int>);
  Expect.isFalse(test7 is F4<String>);
  Expect.runtimeIsType<F4<int>>(test7);
  Expect.runtimeIsNotType<F4<String>>(test7);
}
