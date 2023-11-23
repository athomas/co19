// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion int getUint8(int byteOffset)
/// ...
/// Throws [RangeError] if [byteOffset] is negative, or greater than or equal to
/// the length of this object.
/// @description Checks that an error is thrown if [byteOffset] is negative.
/// @author msyabro
/// @issue 43196


import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var byteData = new ByteData(0);
  Expect.throws(() { byteData.getUint8(-1); });
}
