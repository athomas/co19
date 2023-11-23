// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Error occurring when a collection is modified during iteration.
/// @description Checks that ConcurrentModificationError is thrown if a
/// collection is modified during iteration.
/// @author sgrekhov@unipro.ru

import "../../../Utils/expect.dart";

main() {
  List l = [0, 1, 2, 3, 4];
  Iterator it = l.iterator;
  try {
    while (it.moveNext()) {
      l.remove(it.current);
    }
    Expect.fail("ConcurrentModificationError error should be thrown");
  } on ConcurrentModificationError catch (e) {
    Expect.equals(l, e.modifiedObject);
  }
}
