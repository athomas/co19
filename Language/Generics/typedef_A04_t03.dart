// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A generic type alias is a declaration [D] of one of the following
/// forms:
///   m typedef id<X1 extends B1, . . . , Xs extends Bs> = T;
///   ...
/// [D] introduces a mapping from actual type argument lists to types.
/// @description Checks that [D] maps argument list to types when [T] represents
/// some function
/// @author iarkh@unipro.ru

import "../../Utils/expect.dart";

class X {}
class Y extends X {}

dynamic checkme1() {}
int? checkme2() {}
X? checkme3() {}
Y? checkme4() {}

typedef Func1<T> = T Function();
typedef Func2<T extends X> = T Function();

main() {
  Expect.isTrue(checkme1 is Func1);
  Expect.isTrue(checkme2 is Func1);
  Expect.isTrue(checkme3 is Func1);
  Expect.isTrue(checkme4 is Func1);
  Expect.runtimeIsType<Func1>(checkme1);
  Expect.runtimeIsType<Func1>(checkme2);
  Expect.runtimeIsType<Func1>(checkme3);
  Expect.runtimeIsType<Func1>(checkme4);

  Expect.isFalse(checkme1 is Func2);
  Expect.isFalse(checkme2 is Func2);
  Expect.runtimeIsNotType<Func2>(checkme1);
  Expect.runtimeIsNotType<Func2>(checkme2);
  if (hasSoundNullSafety) {
    Expect.isFalse(checkme3 is Func2);
    Expect.isFalse(checkme4 is Func2);
    Expect.runtimeIsNotType<Func2>(checkme3);
    Expect.runtimeIsNotType<Func2>(checkme4);
  }
}
