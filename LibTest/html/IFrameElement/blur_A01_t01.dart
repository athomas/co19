// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void blur()
/// Removes keyboard focus from the current element.
/// @description Checks that blur event happens when blur() is called.
/// @needsreview timeout

import "dart:html";
import "../../../Utils/expect.dart";

main() {
  IFrameElement x = new IFrameElement();
  document.body?.append(x);

  x.focus();
  x.blur();
  Expect.notEquals(x, document.activeElement);
}
