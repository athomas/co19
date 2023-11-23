// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion E firstWhere(bool test(E element), {Object orElse()})
/// ...
/// If none matches, the result of invoking the orElse function is returned.
/// @description Checks that the [orElse] function is invoked and its result is
/// returned if no element matches [test].
/// @author msyabro


import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var count = 0;
  int f() {
    count++;
    return 1;
  }
  var l = new Int16List.fromList([1, 2, 3, 4, 5, 6, 9]);
  var res = l.firstWhere((element) => false, orElse: f);
  Expect.equals(1, count);
  Expect.equals(1, res);

  res = l.firstWhere((element) => element > 100, orElse: f);
  Expect.equals(2, count);
  Expect.equals(1, res);

  l = new Int16List.fromList([]);
  res = l.firstWhere((element) => true, orElse: f);
  Expect.equals(3, count);
  Expect.equals(1, res);
}
