// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion E single
/// ...
/// Throws a [StateError] if [this] is empty or has more than one element.
/// @description Checks that a [StateError] is thrown if [this] has more than
/// one element.
/// @author msyabro


import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

check(List<Float32x4> array) {
  var l = new Float32x4List.fromList(array);
  Expect.throws(() {
    l.single;
  }, (e) => e is StateError);
}

main() {
  check([pack(1.0), pack(2.0)]);
  check([
    pack(1.0), pack(1.0), pack(1.0), pack(1.0), pack(1.0), pack(1.0),
    pack(1.0), pack(1.0), pack(1.0), pack(1.0), pack(1.0), pack(1.0),
    pack(1.0), pack(1.0), pack(1.0), pack(1.0), pack(1.0), pack(1.0),
    pack(1.0), pack(1.0), pack(1.0), pack(1.0), pack(1.0), pack(1.0),
    pack(1.0), pack(1.0), pack(1.0), pack(1.0), pack(1.0), pack(1.0),
    pack(1.0), pack(1.0), pack(1.0), pack(1.0), pack(1.0), pack(1.0),
    pack(1.0), pack(1.0), pack(1.0), pack(1.0), pack(1.0), pack(1.0),
    pack(1.0), pack(1.0), pack(1.0)
  ]);
}
