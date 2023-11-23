// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// int getUint64(
///     int byteOffset, [
///     Endian endian = Endian.big
/// ])
/// ...
/// Throws an error if [byteOffset] is negative, or `byteOffset + 8` is
/// greater than the length of this object.
/// @description Checks that an error is thrown if `byteOffset + 8` is
/// greater than the length of this object.
/// @issue 12880
/// @author msyabro


import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var byteData = new ByteData(10);
  Expect.throws(() { byteData.getUint64(3 ); });
  Expect.throws(() { byteData.getUint64(20); });
}
