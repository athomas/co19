// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Node insertBefore(Node newChild, Node refChild)
/// Inserts node into this node directly before refChild.
/// MDN: If referenceElement is null, newElement is inserted at the end of the
/// list of child nodes.
/// @description Checks expected dom after insert

import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var div = new Element.html('<div><span></span></div>');
  div.insertBefore(new HRElement(), null);

  Expect.equals(
      '<div><span></span><hr></div>', div.outerHtml, 'insert before null');
}
