// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion final Document ownerDocument
/// The document this node belongs to.
/// @description Checks ownerDocument of nodes created by Element.html factory

import "dart:html";
import "../../../Utils/expect.dart";

main() {
  IFrameElement x = new Element.html('<iframe class="y">Content Text</iframe>')
      as IFrameElement;

  Expect.equals(document, x.ownerDocument, 'nest1');

  Expect.equals(document, x.firstChild?.ownerDocument, 'nest2');
}
