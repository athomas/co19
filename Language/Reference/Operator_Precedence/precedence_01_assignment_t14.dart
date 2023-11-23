// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// Description    Operator                          Associativity Precedence
/// Assignment       >>>=                                 Right          1
/// @description Test that '>>>=' assignment operator has lowest precedence.
/// Compare with cascade '..' (precedence 2) and conditional 'e1 ? e2 : e3'
/// (precedence 3) operators
/// @author iarkh@unipro.ru


import "../../../Utils/expect.dart";

String log = "";

class C {
  int get s => 8;

  void set s(int val) {
    log += val.toString();
  }
}

main() {
  C c = new C();
  c .. s >>>= 2 .. s >>>= 1;
  Expect.equals("24", log);

  log = "";

  c.s >>>= 1 == 2 ? 2 : 3;
  Expect.equals("1", log);
}
