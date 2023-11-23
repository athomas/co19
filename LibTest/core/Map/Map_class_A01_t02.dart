// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Map<K, V> abstract class
/// An unordered collection of key-value pairs, from which you retrieve a value
/// by using its associated key.
/// Each key must be unique. Null values are supported, but null keys are not.
/// @description Checks that multiple values for a key are not supported.
/// @author msyabro

import "../../../Utils/expect.dart";

main() {
  Map<String, Object> map = new Map<String, Object>();
  map["1"] = 1;
  map["1"] = 2;
  
  Expect.isTrue(map.length == 1);
  Expect.isTrue(map["1"] == 2);
}
