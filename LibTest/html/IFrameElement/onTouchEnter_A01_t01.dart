// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion ElementStream<TouchEvent> get onTouchEnter
/// Stream of touchenter events handled by this Element.
/// @description Checks that correct events are delivered via the stream

import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var type = 'touchenter';
  var x = new IFrameElement();

  asyncStart();
  x.onTouchEnter.listen((e) {
    Expect.equals(type, e.type);
    asyncEnd();
  });

  var event = new TouchEvent(type);
  x.dispatchEvent(event);
}
