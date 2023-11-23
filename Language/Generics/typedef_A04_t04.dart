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

void checkme1(dynamic a) {}
void checkme2(Null a) {}
void checkme3(int a) {}
void checkme4(X a) {}
void checkme5(Y a) {}

typedef Func1<T> = void Function(T);
typedef Func2<T extends X> = void Function(T);
typedef Func3<T extends Y> = void Function(T);

main() {
  Expect.isTrue(checkme1 is Func1);
  Expect.isFalse(checkme2 is Func1);
  Expect.isFalse(checkme3 is Func1);
  Expect.isFalse(checkme4 is Func1);
  Expect.isFalse(checkme5 is Func1);
  Expect.runtimeIsType<Func1>(checkme1);
  Expect.runtimeIsNotType<Func1>(checkme2);
  Expect.runtimeIsNotType<Func1>(checkme3);
  Expect.runtimeIsNotType<Func1>(checkme4);
  Expect.runtimeIsNotType<Func1>(checkme5);

  Expect.isTrue (checkme1 is Func2);
  Expect.isFalse(checkme2 is Func2);
  Expect.isFalse(checkme3 is Func2);
  Expect.isTrue (checkme4 is Func2);
  Expect.isFalse(checkme5 is Func2);
  Expect.runtimeIsType<Func2>(checkme1);
  Expect.runtimeIsNotType<Func2>(checkme2);
  Expect.runtimeIsNotType<Func2>(checkme3);
  Expect.runtimeIsType<Func2>(checkme4);
  Expect.runtimeIsNotType<Func2>(checkme5);

  Expect.isTrue (checkme1 is Func3);
  Expect.isFalse(checkme2 is Func3);
  Expect.isFalse(checkme3 is Func3);
  Expect.isTrue (checkme4 is Func3);
  Expect.isTrue (checkme5 is Func3);
  Expect.runtimeIsType<Func3>(checkme1);
  Expect.runtimeIsNotType<Func3>(checkme2);
  Expect.runtimeIsNotType<Func3>(checkme3);
  Expect.runtimeIsType<Func3>(checkme4);
  Expect.runtimeIsType<Func3>(checkme5);
}
