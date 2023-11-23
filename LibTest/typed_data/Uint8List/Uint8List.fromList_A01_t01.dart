// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Uint8List.fromList(List<int> list)
/// Creates a [Uint8List] with the same length as the [elements] list and copies
/// over the elements.
/// @description Checks that an instance of Uint8List is created.
/// @author msyabro

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(List<int> array) {
  Uint8List l = new Uint8List.fromList(array);
  Expect.isTrue(l is Uint8List);
  Expect.runtimeIsType<Uint8List>(l);
}

main() {
  check([]);
  check([255, 128]);
  check([1000, 1000, 1000]);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17]);
}
