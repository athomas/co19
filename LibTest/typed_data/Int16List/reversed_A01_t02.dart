// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Iterable<E> reversed
/// Returns an [Iterable] of the elements of this [List] in reverse order.
/// @description Checks that [reversed] is read-only and can't be set.
/// @author msyabro


import "dart:typed_data";
import "../../../Utils/expect.dart";

check(List<int> list) {
  dynamic l = new Int16List.fromList(list);
  Expect.throws(() { l.reversed = list; }, (e) => e is NoSuchMethodError);
}

main() {
  check([]);
  var list = List<int>.filled(255, 0);
  for (int i = 0; i < 255; ++i) {
    list[i] = i;
  }
  check(list);
}
