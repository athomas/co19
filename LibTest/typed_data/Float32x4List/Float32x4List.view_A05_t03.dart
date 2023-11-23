// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// Float32x4List.view(
///     ByteBuffer buffer, [
///     int byteOffset = 0,
///     int length
/// ])
/// Throws [RangeError] if [offsetInBytes] or [length] are negative, or if
/// [offsetInBytes] + ([length] * elementSizeInBytes) is greater than the length
/// of [buffer].
/// @description Checks that an error is thrown if [offsetInBytes] +
/// ([length] * elementSizeInBytes) is greater than the length of [buffer].
/// @author msyabro
/// @issue 43196


import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

void check(List<Float32x4> array, int offset, int length) {
  var tmp = new Float32x4List.fromList(array);
  var byteBuffer = tmp.buffer;
  Expect.throws(() { Float32x4List.view(byteBuffer, offset, length); });
}

main() {
  check([], 0, 1);
  check([pack(0.0)], 0, 5);
  check([pack(0.0)], 1, 2);
  check([pack(100.0), pack(50.0)], 2 * 16, 1);
  check([pack(100.0), pack(50.0)], 4, 20);
  check([
    pack(0.0), pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0),
    pack(6.0), pack(7.0), pack(8.0), pack(9.0), pack(10.0), pack(11.0),
    pack(12.0), pack(13.0), pack(14.0), pack(15.0), pack(16.0), pack(17.0)
  ], 20, 20);
}
