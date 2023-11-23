// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Likewise, if a type annotation is omitted on a formal parameter
/// in typedef declaration, it is taken to be dynamic.
/// @description Checks that function types with various types of formal
/// optional parameter and named parameter are subtypes of given type t1 whose
/// declaration omits parameter types, therefore the type of formal parameter
/// of t1 should be dynamic.
/// @author iefremov, sgrekhov@unipro.ru

import '../../../Utils/expect.dart';

typedef F1([x]);
typedef F2({x});

typedef Func();
typedef int Func2(int x);

main() {
  Expect.isTrue(([x]) {} is F1);
  Expect.isTrue(([dynamic x]) {} is F1);
  Expect.isFalse(([int x = 0]) {} is F1);
  Expect.isTrue(([Object? x]) {} is F1);
  Expect.isFalse(([Func? x]) {} is F1);
  Expect.isFalse(([Func2? x]) {} is F1);
  Expect.runtimeIsType<F1>(([x]) {});
  Expect.runtimeIsType<F1>(([dynamic x]) {});
  Expect.runtimeIsNotType<F1>(([int x = 0]) {});
  Expect.runtimeIsType<F1>(([Object? x]) {});
  Expect.runtimeIsNotType<F1>(([Func? x]) {});
  Expect.runtimeIsNotType<F1>(([Func2? x]) {});

  Expect.isTrue(({x}) {} is F2);
  Expect.isTrue(({dynamic x}) {} is F2);
  Expect.isFalse(({int x = 0}) {} is F2);
  Expect.isTrue(({Object? x}) {} is F2);
  Expect.isFalse(({Func? x}) {} is F2);
  Expect.isFalse(({Func2? x}) {} is F2);
  Expect.runtimeIsType<F2>(({x}) {});
  Expect.runtimeIsType<F2>(({dynamic x}) {});
  Expect.runtimeIsNotType<F2>(({int x = 0}) {});
  Expect.runtimeIsType<F2>(({Object? x}) {});
  Expect.runtimeIsNotType<F2>(({Func? x}) {});
  Expect.runtimeIsNotType<F2>(({Func2? x}) {});
}
