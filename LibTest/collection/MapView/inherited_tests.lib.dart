// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion class MapView<K, V>
/// Wrapper around a class that implements Map that only exposes Map members.
/// @description Checks that all members of [Map] are implemented.
/// @author sgrekhov@unipro.ru

library allTests_A01_t01;

import "../../core/Map/compKeysTests.lib.dart" as compKeysTests;
import "../../core/Map/nonCompKeysTests.lib.dart" as nonCompKeysTests;
import "../../core/Map/compKeysWarnTests.lib.dart" as compKeysWarnTests;

test(Map create([Map content])) {
  compKeysTests.test(create);
  nonCompKeysTests.test(create);
  compKeysWarnTests.test(create);
}
