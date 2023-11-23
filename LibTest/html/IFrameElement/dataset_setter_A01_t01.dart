// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Map<String, String> dataset
/// Allows access to all custom data attributes (data-*) set on this element.
/// Any keys from markup will be converted to camel-cased keys in the map.
/// @description Checks that change to dataset map is reflected in the element

import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {
  IFrameElement x = new Element.html('<iframe data-foo-bar="1"></iframe>',
      treeSanitizer: new NullTreeSanitizer()) as IFrameElement;

  x.dataset = {'fooBar': 'one', 'fooBarBaz': 'two'};

  Expect.mapEquals(
      {'data-foo-bar': 'one', 'data-foo-bar-baz': 'two'}, x.attributes);
}
