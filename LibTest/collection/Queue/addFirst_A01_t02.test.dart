// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion  void addFirst(E value)
/// Adds [value] at the beginning of the queue.
/// @description Checks that method does not affect other content of the queue
/// @author msyabro

library addFirst_A01_t02;

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
  queue.addFirst(null);
  check([null], queue);
  queue.addFirst(0);
  check([0, null], queue);
  queue.addFirst("1");
  check(["1", 0, null], queue);
}
