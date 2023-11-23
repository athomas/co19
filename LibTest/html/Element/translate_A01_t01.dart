// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool translate
/// Specifies whether this element's text content changes when the page is
/// localized.
/// @description Checks expected attribute values.

import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var x = new Element.html('<p translate=no></p>');
  Expect.isFalse(x.translate, 'explicit no');

  x = new Element.html('<p translate=yes></p>');
  Expect.isTrue(x.translate, 'explicit yes');

  x = new Element.html('<p translate=""></p>');
  Expect.isTrue(x.translate, 'empty string is yes');
}
