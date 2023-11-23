// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void addFirst(E value)
/// Adds [value] at the beginning of the queue.
/// @description Checks that [value] is added to the beginning of the queue.
/// @author kaigorodov

import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  DoubleLinkedQueue queue = new DoubleLinkedQueue();
  
  queue.addFirst(1);
  Expect.isTrue(queue.first == 1);
  
  queue.addFirst(null);
  Expect.isTrue(queue.first == null);
  
  queue.addFirst(queue);
  Expect.identical(queue.first, queue);

  queue = new DoubleLinkedQueue();
  for (var i = 0; i <= 1000; i++) {
    queue.addFirst(i);
    Expect.equals(i, queue.first);
    Expect.equals(i + 1, queue.length);
  }
}
