// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Stream<ProgressEvent> get onLoadStart
/// Stream of loadstart events handled by this HttpRequestEventTarget.
/// @description Checks that only single event is fired.

import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var request = new HttpRequest();
  bool first = true;
  request.open('GET', "test.dart");
  asyncStart();
  request.onLoadStart.listen((event) {
    Expect.isTrue(first);
    first = false;
    asyncEnd();
  });
  request.send();
}
