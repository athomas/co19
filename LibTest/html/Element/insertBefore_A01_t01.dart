// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Node insertBefore(Node newChild, Node refChild)
/// Inserts node into this node directly before refChild.
/// @description Checks expected dom after insert

import "dart:html";
import "../../../Utils/expect.dart";

main() {
  //-------------------
  var div = new Element.html('<div><span></span></div>');
  var ref = div.querySelector('span');
  div.insertBefore(new HRElement(), ref);

  Expect.equals('<div><hr><span></span></div>', div.outerHtml,
      'insert before existing child');

  //-------------------
  div = new Element.html('<div><span></span></div>');
  ref = new PreElement(); // not a child

  Expect.throws(() {
    div.insertBefore(new HRElement(), ref);
  }, null, 'insert before not existing child');
}
