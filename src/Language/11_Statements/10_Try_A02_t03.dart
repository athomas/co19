/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A catch clause of one of the forms on T1 catch(p1) s, catch (T1 p1, T2 p2) s, catch (T1 p1,
 * final p2) s, catch (T1 p1, final T2 p2) s, catch (T1 p1, var p2) s, catch ( final T1
 * p1, T2 p2) s, catch ( final T1 p1, final p2) s, catch ( final T1 p1, final T2 p2) s
 * or catch ( final T1 p1, var p2) s matches an object o if the type of o is a subtype of T1.
 * @description Checks that a catch clause matches an object o if the type of o is a subtype of T1.
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */

import "10_Try_lib.dart";

class T1 {
  T1() {}
}
class T2 extends T1 {
  T2() {}
}

main() {
  bool success = false;
  try {
    throw new T2();
  } on T1 catch(p1) {
    success = true;
  }
  Expect.isTrue(success);

  success = false;
  try {
    throw new T2();
  } on T1 catch (p1, st) {
    success = true;
  }
  Expect.isTrue(success);

  // imported type
  success = false;
  try {
    throw new Foo();
  } catch(p1, st) {
    success = true;
  }
  Expect.isTrue(success);
}
