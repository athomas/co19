// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void focus()
/// Gives keyboard focus to the current element.
/// @description Checks that focus event happens when focus() is called.

import "dart:html";
import "../../../Utils/expect.dart";

main() {
  IFrameElement x = new IFrameElement();
  document.body?.append(x);

  x.focus();
  Expect.equals(x, document.activeElement);
}
