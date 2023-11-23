// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// Int32List.view(
///     ByteBuffer buffer, [
///     int offsetInBytes = 0,
///     int length
/// ])
/// ...
/// Changes in the [Int32List] will be visible in the byte buffer and vice versa.
/// @description Checks that changes in the [Int32List] will be visible in the
/// byte buffer and vice versa.
/// @author msyabro


import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var tmp = new Int32List.fromList([0, 0, 0]);
  var byteBuffer = tmp.buffer;
  var l = new Int32List.view(byteBuffer, 0, 3);

  tmp[0] = 1;
  Expect.equals(tmp[0], l[0]);
  l[1] = 2;
  Expect.equals(l[1], tmp[1]);
}
