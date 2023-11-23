// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion List<E> sublist(int start, [int end])
/// ...
/// An error occurs if start is outside the range 0 .. length or if end is
/// outside the range start .. length
/// @description Checks that an error occurs if start is outside the range
/// 0 .. length or if end is outside the range start .. length
/// @author sgrekhov@unipro.ru

library sublist_A03_t01;

import "../../../Utils/expect.dart";

test(List<E> create<E>([int length, E fill])) {
  List lst = create();
  lst.addAll([0, 1, 2, 3, 4]);

  Expect.throws(() {lst.sublist(-1);});
  Expect.throws(() {lst.sublist(6);});
  Expect.throws(() {lst.sublist(0, -1);});
  Expect.throws(() {lst.sublist(0, 6);});
}
