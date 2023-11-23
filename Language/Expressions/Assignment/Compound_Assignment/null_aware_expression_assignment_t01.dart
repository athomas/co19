// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Evaluation of a compound assignment of the form e1.v ??= e2 is
/// equivalent to the evaluation of the expression
/// ((x) => ((y) => y == null ? x.v = e2 : y)(x.v))(e1) where x and y are
/// distinct fresh variables that are not used in e2.
/// @description Checks that in expression of the form e1.v ??= e value is set
/// only if e1.v == null
/// @author sgrekhov@unipro.ru


import '../../../../Utils/expect.dart';

class C {
  var v = null;
}

main() {
  C c = new C();
  c.v ??= 1;
  Expect.equals(1, c.v);

  c.v ??= 2;
  Expect.equals(1, c.v);
}
