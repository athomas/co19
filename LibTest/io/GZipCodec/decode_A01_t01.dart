// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion S decode(T encoded)
/// @description Checks that this method decodes data from gzip
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";

main() {
  GZipCodec codec = new GZipCodec();
  int max = 1000;
  List<int> data = new List<int>.filled(max, 0);
  for (int i = 0; i < max; i++) {
    data[i] = i % 256;
  }
  List<int> encoded = codec.encoder.convert(data);

  Expect.listEquals(data, codec.decode(encoded));
}
