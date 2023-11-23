// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion  int lastIndexOf(Object element, [ int startIndex ])
/// Returns the last index in the list a of the given [element], starting the
/// search at index [startIndex] to 0.
/// @description Checks that if [start] is not specified, searches the entire
/// list from the very end.
/// @author iarkh@unipro.ru

import "dart:collection";
import "../../../Utils/expect.dart";

main() {
  UnmodifiableListView a = new UnmodifiableListView(
      [42, 0, -1, 42, -1, 6031769, 0]);
  Expect.equals(3, a.lastIndexOf(42));
  Expect.equals(6, a.lastIndexOf(0));
  Expect.equals(4, a.lastIndexOf(-1));
  Expect.equals(5, a.lastIndexOf(6031769));
}
