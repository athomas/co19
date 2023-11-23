// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion final String outerHtml
/// Gets the markup of the element including its content.
/// @description Checks expected outerHtml settings

import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var x0 = new Element.html('<div></div>');
  Expect.equals('<div></div>', x0.outerHtml);

  var x = document.body;
  if (x != null) {
    var h = '<!--comment--><button>foo</button>';
    x.innerHtml = h;
    Expect.equals('<body>$h</body>', x.outerHtml);
  } else {
    Expect.fail("Body is null");
  }
}
