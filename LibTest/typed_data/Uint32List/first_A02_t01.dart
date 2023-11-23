// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion E first
/// ...
/// Throws a StateError if this is empty.
/// @description Checks that a [StateError] is thrown if a list is empty.
/// @author msyabro


import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Uint32List.fromList([]);
  Expect.throws(() { l.first; }, (e) => e is StateError);
}
