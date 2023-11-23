// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion E firstWhere(bool test(E element), {Object orElse()})
/// ...
/// If orElse is omitted, it defaults to throwing a [StateError].
/// @description Checks that a [StateError] is thrown if no element satisfies
/// [test] and [orElse] is omitted.
/// @author msyabro


import "dart:typed_data";
import "../../../Utils/expect.dart";

check(List<int> list) {
  var l = new Uint32List.fromList(list);
  Expect.throws(() { l.firstWhere((e) => false); }, (e) => e is StateError);
}

main() {
  check([]);
  check([0]);
  check([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
}
