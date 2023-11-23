// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion dynamic firstWhere(bool test(E element), {Object orElse()})
/// Returns the first element that satisfies the given predicate [test].
/// @description Checks that the first element that satisfies
/// the given predicate is returned.
/// @author msyabro

import "../../../Utils/expect.dart";

main() {
  var runes = new Runes('\x01\x02\x03\x04\x05\x06\x09');
  var res = runes.firstWhere((element) => element == 1);
  Expect.equals(1, res);

  res = runes.firstWhere((element) => element > 6);
  Expect.equals(9, res);

  res = runes.firstWhere((element) => element > 1);
  Expect.equals(2, res);
}
