// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion ChunkedConversionSink<Object> startChunkedConversion(
///  Sink<List<int>> sink
///  )
/// Start a chunked conversion.
/// ...
/// @description Checks that this method transforms stream's events
/// @author sgrekhov@unipro.ru

import "dart:convert";
import "../../../Utils/expect.dart";

check(data) {
  JsonUtf8Encoder encoder = new JsonUtf8Encoder();
  bool called = false;
  Sink<List<int>> outSink = new ChunkedConversionSink.withCallback((chunks) {
    Expect.listEquals([encoder.convert(data)], chunks);
    called = true;
  });

  var inSink = encoder.startChunkedConversion(outSink);
  inSink.add(data);
  inSink.close();
  Expect.isTrue(called);
}

main() {
  check(1);
  check(3.14);
  check(null);
  check(true);
  check(false);
  check('"str"');
  check(["1", "2", "3.14"]);
  check([[1, 2, 3], {"a": "3"}]);
  check({"a": "b"});
  check({"й": " ф "});
}
