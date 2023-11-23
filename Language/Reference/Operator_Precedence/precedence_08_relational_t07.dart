// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// Description    Operator                          Associativity Precedence
/// Relational        <=                                 None           8
/// @description Test that '<=' relational operator has precedence (8).
/// Compare with Equality '==' operator (precedence 7). Test that '<=' has
/// priority higher than '=='
/// @author sgrekhov@unipro.ru

import "../../../Utils/expect.dart";

main() {
  Expect.equals((7 <= 2) == (2 <= 1), 7 <= 2 == 2 <= 1);
}
