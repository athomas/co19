// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future<String> decodeStream(Stream<List<int>> byteStream)
/// @description Checks that this method decodes stream to UTF-8 string
/// @author sgrekhov@unipro.ru

import "dart:async";
import "dart:convert";
import "../../../Utils/expect.dart";

Future check(String str) async {
  Utf8Codec codec = new Utf8Codec();
  List<int> data = codec.encode(str);
  Stream<List<int>> byteStream = new Stream.fromIterable([data]);
  codec.decodeStream(byteStream).then((String s) {
    Expect.equals(str, s);
  });
}

main() {
  asyncStart();
  Future.wait([
    check("Some string"),
    check("Кириллица прекрасна")
  ]).then(
      (_) => asyncEnd()
  );
}
