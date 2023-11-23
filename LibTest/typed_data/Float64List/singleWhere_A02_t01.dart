// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion E singleWhere(bool test(E element))
/// ...
/// Otherwise, if there are no matching elements, or if there is more than one
/// matching element, a [StateError] is thrown.
/// @description Checks that a [StateError] is thrown if no element matches
/// [test].
/// @author msyabro


import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Float64List.fromList([]);
  Expect.throws(() {
    l.singleWhere((e) => true);
  }, (e) => e is StateError);

  l = new Float64List.fromList([1.0, 2.0, 3.0, 4.0, 5.0]);
  Expect.throws(() {
    l.singleWhere((e) => e == 0);
  }, (e) => e is StateError);

  l = new Float64List.fromList([1.0, 2.0, 3.0, 4.0, 5.0]);
  Expect.throws(() {
    l.singleWhere((e) => false);
  }, (e) => e is StateError);
}
