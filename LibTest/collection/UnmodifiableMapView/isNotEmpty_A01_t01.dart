// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion final bool isNotEmpty
/// @description Check that [true] is returned only if the map is not empty.
/// @author iarkh@unipro.ru

import "dart:collection";
import "../../../Utils/expect.dart";

main() {
  UnmodifiableMapView view = new UnmodifiableMapView({1 : 1, 2 : 23, 37 : 49});
  Expect.isTrue(view.isNotEmpty);

  view = new UnmodifiableMapView({});
  Expect.isFalse(view.isNotEmpty);
}
