// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void fillRange(int start, int end, [E fillValue])
/// ...
/// The provide range, given by start and end, must be valid. A range from start
/// to end is valid if 0 <= start <= end <= len, where len is this list's length.
/// The range starts at start and has length end - start. An empty range
/// (with end == start) is valid.
/// It is an error if start.. end is not a valid range pointing into the [this].
/// @description Checks that it is an error if the given range is not valid.
/// @author msyabro


import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Float64List(1000);
  Expect.throws(() {
    l.fillRange(-100, -10, 1.0);
  });

  Expect.throws(() {
    l.fillRange(-1, 2, 1.0);
  });

  Expect.throws(() {
    l.fillRange(1000, 0, 1.0);
  });

  Expect.throws(() {
    l.fillRange(0, 1001, 1.0);
  });

  Expect.throws(() {
    l.fillRange(999, 1001, 1.0);
  });
}
