// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool isNotEmpty
/// Returns true if there is at least one element in this collection.
/// @description Checks that isNotEmpty is read-only and cannot be set.
/// @author ngl@unipro.ru


import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  dynamic obj = new Float64x2List(0);
  Expect.throws(() { obj.isNotEmpty = true;  }, (e) => e is NoSuchMethodError);
  Expect.throws(() { obj.isNotEmpty = false; }, (e) => e is NoSuchMethodError);
}
