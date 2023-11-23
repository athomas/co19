// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool contains(Object element)
/// Returns true if the collection contains an element equal to [element].
/// @description Checks that the method returns true if at least one element
/// of this collection equals to element.
/// @author kaigorodov

import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  DoubleLinkedQueue queue = new DoubleLinkedQueue();
  Expect.isFalse(queue.contains(1));
  
  queue.addFirst(1);
  Expect.isFalse(queue.contains(0));
  Expect.isTrue(queue.contains(1));
  
  queue.addFirst(1);
  Expect.isTrue(queue.contains(1));
  
  queue.addLast(2);
  Expect.isFalse(queue.contains(0));
  Expect.isTrue(queue.contains(1));
  Expect.isTrue(queue.contains(2));
}
