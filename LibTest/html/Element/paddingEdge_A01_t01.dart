// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion final paddingEdge
/// Access the dimensions and position of this element's content + padding box.
/// This returns a rectangle with the dimenions actually available for content
/// in this element, in pixels, regardless of this element's box-sizing
/// property. Unlike getBoundingClientRect, the dimensions of this rectangle
/// will return the same numerical height if the element is hidden or not.
/// @description Checks that if element is hidden it does not affect dimensions
/// of the rectangle.
/// @issue 43294

import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var x = new Element.html('<div><a>A</a>Text</div>');
  x.hidden = true;
  document.body?.append(x);

  Expect.isTrue(x.paddingEdge.width > 0, 'width');
  Expect.isTrue(x.paddingEdge.height > 0, 'height');
}
