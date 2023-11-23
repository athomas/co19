// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A composite member invocation on a target expression X is an
/// expression of one of the forms:
/// Composite member invocation on target X	     Corresponding member base name
///    X.id binop= expr2	                                       id
/// @description Check explicit extension member invocation in form of
/// X.id <<= expr2
/// @author sgrekhov@unipro.ru


import "../../Utils/expect.dart";

class C {
  int value;
  C() : value = 42 {}
  init() {
    value = 42;
  }
  int get id => value;
  void set id(int v) {
    this.value = v;
  }
}

extension Extension1 on C {
  int get id => this.value + 1;
  void set id(int v) {
    this.value = v + 1;
  }
}

extension Extension2 on C {
  int get id => this.value + 2;
  void set id(int v) {
    this.value = v + 2;
  }
}

main() {
  C c = C();
  Extension1(c).id <<= 2;
  Expect.equals(173, c.value);
  c.init();
  Extension2(c).id <<= 2;
  Expect.equals(178, c.value);
  c.init();
  c.id <<= 2;
  Expect.equals(168, c.value);
}
