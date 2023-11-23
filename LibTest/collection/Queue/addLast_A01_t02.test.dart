// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void addLast(E value)
/// Adds [value] at the end of the queue.
/// @description Checks that method does not affect other elements of the queue
/// @author msyabro

library addLast_A01_t02;

import "../../../Utils/expect.dart";
import "dart:collection";

check(List expected, Queue actual) {
  Expect.equals(expected.length, actual.length);
  int i = 0;
  actual.forEach((var element) {
    Expect.equals(expected[i++], element);
  });
}
 
test(Queue create([Iterable content])) {
  Queue queue = create();
  
  Expect.isTrue(queue.length == 0);
  queue.addLast(null);
  check([null], queue);
  queue.addLast(0);
  check([null, 0], queue);
  queue.addLast("1");
  check([null, 0, "1"], queue);
}
