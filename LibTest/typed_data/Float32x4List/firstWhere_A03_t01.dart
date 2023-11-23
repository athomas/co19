// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion E firstWhere(bool test(E element), {E orElse()})
/// ...
/// If [orElse] is omitted, it defaults to throwing a [StateError].
/// @description Checks that a [StateError] is thrown when orElse is omitted and
/// no element satisfied test.
/// @author msyabro


import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 o() => new Float32x4.zero();

check(List<Float32x4> list) {
  var l = new Float32x4List.fromList(list);
  Expect.throws(() { l.firstWhere((e) => false); }, (e) => e is StateError);
}

main() {
  check([]);
  check([o()]);
  check([o(), o(), o(), o(), o(), o(), o(), o(), o(), o(), o(), o(), o(), o()]);
}
