// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// Int64List.view(
///     ByteBuffer buffer, [
///     int byteOffset = 0,
///     int length
/// ])
/// ...
/// Throws [RangeError] if [offsetInBytes] or [length] are negative, or if
/// [offsetInBytes] + ([length] * elementSizeInBytes) is greater than the length
/// of [buffer].
/// @description Checks that an error is thrown if [offsetInBytes] +
/// ([length] * elementSizeInBytes) is greater than the length of [buffer].
/// @author msyabro


import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(List<int> array, int offset, int length) {
  var tmp = new Int64List.fromList(array);
  var byteBuffer = tmp.buffer;
  Expect.throws(() { Int64List.view(byteBuffer, offset, length); });
}

main() {
  check([], 0, 1);
  check([0], 0, 7);
  check([0], 1, 2);
  check([100, 50], 2, 20);
  check([100, 50], 4, 20);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17], 80, 20);
}
