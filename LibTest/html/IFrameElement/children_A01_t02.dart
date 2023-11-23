// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion List<Element> children
/// List of the direct children of this element.
/// @description Checks that change to children is reflected in the element

import "dart:html";
import "../../../Utils/expect.dart";

main() {
  IFrameElement x = new IFrameElement();
  x.append(new SpanElement());
  x.append(new SpanElement());

  x.children.removeAt(0);
  x.children[0].text = 'foo';
  x.children.add(new Element.html('<span>bar</span>'));

  Expect.equals(
      '<iframe><span>foo</span><span>bar</span></iframe>', x.outerHtml);
}
