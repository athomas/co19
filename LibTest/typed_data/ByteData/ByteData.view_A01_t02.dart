// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// ByteData.view(
///     ByteBuffer buffer, [
///     int offsetInBytes = 0, int length
/// ])
/// Creates an [ByteData] view of the specified region in buffer.
/// @description Checks that a new instance has the same elements as
/// the specified region.
/// @author msyabro


import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(List<int> array, int offset, int length) {
  var tmp = new Uint8List.fromList(array);
  var byteBuffer = tmp.buffer;

  ByteData l = new ByteData.view(byteBuffer, offset, length);
  Expect.equals(length, l.lengthInBytes);
  for (int i = 0; i < l.lengthInBytes; ++i) {
    Expect.equals(tmp[offset ~/ Uint8List.bytesPerElement + i], l.getUint8(i));
  }
}

main() {
  check([], 0, 0);
  check([1], 0, 1);
  check([127, 128], 0, 2);
  check([1000, 1000, 1000], 0, 3);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17], 0, 18);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17], 5, 13);
  check([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17], 17, 1);
}
