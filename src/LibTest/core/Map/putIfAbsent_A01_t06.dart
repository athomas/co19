/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract V putIfAbsent(K key, V ifAbsent())
 * If [key] is not associated to a value, calls [ifAbsent] and
 * updates the map by mapping [key] the value returned by [ifAbsent].
 * Returns the value in the map.
 * @description Tries to pass null as [ifAbsent] and checks that
 * an exception or error is thrown.
 * @author msyabro
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";


main() {
  Object putIfAbsent() {
    return new Object();
  }
  
  Map<String, Object> map = new Map<String, Object>();
  
  Expect.throws(() {
    map.putIfAbsent("1", null);
  });

  Expect.isFalse(map.containsKey("1"));
}
