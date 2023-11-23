// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion int end
/// @description Checks that this property returns length - 1
/// @author sgrekhov@unipro.ru

import "../../../Utils/expect.dart";

main() {
  var indexable = [1, 2, 3];
  IndexError e = new IndexError(12, indexable);
  Expect.equals(e.length - 1, e.end);
}
