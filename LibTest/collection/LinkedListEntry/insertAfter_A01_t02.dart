// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void insertAfter(E entry)
/// Insert an element after this element in this element's linked list.
/// @description Checks that entry is inserted after this element. Try to add
/// entry after the last element
/// @author sgrekhov@unipro.ru

import "dart:collection";
import "../../../Utils/expect.dart";
import "LinkedListEntry.lib.dart";

main() {
  LinkedList<MyLinkedListEntry> list = new LinkedList<MyLinkedListEntry<int>>();
  MyLinkedListEntry<int> entry1 = new MyLinkedListEntry<int>(1);
  MyLinkedListEntry<int> entry2 = new MyLinkedListEntry<int>(2);
  MyLinkedListEntry<int> entry3 = new MyLinkedListEntry<int>(2);
  list.add(entry1);
  list.add(entry2);
  entry2.insertAfter(entry3);

  Expect.identical(list, entry3.list);
  Expect.identical(entry3, entry2.next);
  Expect.identical(entry2, entry3.previous);
  Expect.identical(entry3, list.last);
}
