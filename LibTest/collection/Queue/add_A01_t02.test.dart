// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion  void add(E value)
/// Adds [value] at the end of the queue.
/// @description Checks that method does not affect previous elements of the
/// queue
/// @author msyabro

library add_A01_t02;
 
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

  check([],queue);
  queue.add(null);
  check([null], queue);
  queue.add(0);
  check([null, 0], queue);
  queue.add("1");
  check([null, 0, "1"], queue);
  queue.add(queue);
  check([null, 0, "1", queue], queue);
}
