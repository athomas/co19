// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion ElementStream<MouseEvent> get onDragOver
/// A stream of dragover events fired when a dragged object is currently being
/// dragged over this element.
/// @description Checks that correct events are delivered via the stream

import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var type = 'dragover';
  var x = document.body;
  if (x != null) {
    asyncStart();
    x.onDragOver.listen((e) {
      Expect.equals(type, e.type);
      asyncEnd();
    });

    var event = new MouseEvent(type);
    x.dispatchEvent(event);
  } else {
    Expect.fail("Body is null");
  }
}
