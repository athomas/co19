// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion final bool length
/// @description Check that [length] is a read-only property.
/// @author iarkh@unipro.ru

import "../../../Utils/expect.dart";
import "unmodifiablemapbase.lib.dart";

main() {
  dynamic base = new UnmodifiableMapBaseImpl(
      {1 : 1, 2 : 23, 37 : 49});
  Expect.throws(() { base.length = 5; }, (e) => e is NoSuchMethodError);
}
