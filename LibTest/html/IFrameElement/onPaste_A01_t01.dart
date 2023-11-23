// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion ElementStream<Event> get onPaste
/// Stream of paste events handled by this Element.
/// @description Checks that correct events are delivered via the stream

import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var type = 'paste';
  var x = new IFrameElement();

  asyncStart();
  x.onPaste.listen((e) {
    Expect.equals(type, e.type);
    asyncEnd();
  });

  var event = new ClipboardEvent(type);
  x.dispatchEvent(event);
}
