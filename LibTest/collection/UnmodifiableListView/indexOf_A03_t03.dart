// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion int indexOf(E element, [int start = 0])
/// Returns [-1] if given [element] is not found.
/// @description Checks that [-1] is returned, if the [element] is not present in
/// the list and [start] index is specified and [start > 0]
/// @author iarkh@unipro.ru

import "dart:collection";
import "../../../Utils/expect.dart";

main() {
  UnmodifiableListView a =
      new UnmodifiableListView([42, 0, -1, 42, -1, 6031769, 0]);
  Expect.equals(-1, a.indexOf(3.14, 3));
  Expect.equals(-1, a.indexOf(null, 2));
  Expect.equals(-1, a.indexOf(a, 4));
  Expect.equals(-1, a.indexOf(8, 14));
}
