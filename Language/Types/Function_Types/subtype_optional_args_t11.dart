// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A function type (T1,...Tk,[Tk+1,...,Tn+m]) -> T is a subtype of
/// the function type (S1,...,Sk+j,[Sk+j+1,...,Sn]) -> S, if all of the following
/// conditions are met:
/// 1. Either
///    • S is void, or
///    • T <=> S.
/// 2. ∀i ∈ 1..n, Ti ⇐⇒ Si.
/// @description Checks that function type t1 is a subtype of function type t2
/// even if t1 has less required parameters but accepts the same or greater
/// number of required and optional parameters.
/// @author iefremov

import "../../../Utils/expect.dart";

typedef t1(int x);
typedef t2(int x, int y);

main() {
  Expect.isTrue(([int x = 42]) {} is t1);
  Expect.isTrue(([var x]) {} is t1);
  Expect.isTrue((int x, [int y = 42]) {} is t2);
  Expect.isTrue(([int x = 4, int y = 2]) {} is t2);
  Expect.runtimeIsType<t1>(([int x = 42]) {});
  Expect.runtimeIsType<t1>(([var x]) {});
  Expect.runtimeIsType<t1>((int x, [int y = 42]) {} );
  Expect.runtimeIsType<t1>(([int x = 4, int y = 2]) {});
}
