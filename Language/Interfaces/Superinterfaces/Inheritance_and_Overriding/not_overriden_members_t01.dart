// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An interface I inherits any members of its superinterfaces that
/// are not overridden by members declared in I.
/// @description Checks that there're no static warnings produced when
/// attempting to access the inherited non-static members of a null variable
/// whose static type is an interface extending another interface that declares
/// those members. This should indirectly prove that they're indeed inherited
/// by the subinterface.
/// @author sgrekhov@unopro.ru

import '../../../../Utils/expect.dart';

abstract class I {
  void m();
  int get gett0r;
  void set sett0r(int v);
  I operator+(int i);
}

abstract class C implements I {
}

main() {
  C? c = null;

  c?.m();
  c?.gett0r;
  c?.sett0r = 1;
  Expect.throws(() {(c as C) + 1;});
}
