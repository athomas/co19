// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion E first
/// Returns the first element.
/// Throws a StateError if this is empty. Otherwise returns the first element
/// in the iteration order, equivalent to this.elementAt(0).
/// @description Checks that a [StateError] is thrown if a list is empty.
/// @author msyabro


import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Float32List.fromList([]);
  Expect.throws(() { l.first; }, (e) => e is StateError);
}
