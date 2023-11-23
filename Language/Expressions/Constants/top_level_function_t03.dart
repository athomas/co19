// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constant expression is an expression whose value can never
/// change, and that can be evaluated entirely at compile time.
/// A constant expression is one of the following:
/// . . .
/// • A simple or qualified identifier denoting a top-level function or a static
///   method that is not qualified by a deferred prefix.
/// @description Checks that a simple or qualified identifier denoting a
/// top-level function or a static method can be assigned to a constant
/// variable.
/// @author ngl@unipro.ru

import '../../../Utils/expect.dart';
import 'constants_lib.dart' as clib;

void F() {}

class B {
  static void M() {}
}

const a = F;
const b = B.M;
const c = clib.F;
const d = clib.B.M;

main() {
  Expect.isTrue(a is Function);
  Expect.isTrue(b is Function);
  Expect.isTrue(c is Function);
  Expect.isTrue(d is Function);
  Expect.runtimeIsType<Function>(a);
  Expect.runtimeIsType<Function>(b);
  Expect.runtimeIsType<Function>(c);
  Expect.runtimeIsType<Function>(d);
}
