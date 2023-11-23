// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Type runtimeType
/// A representation of the runtime type of the object.
/// @description Checks that [runtimeType] is read-only and can not be set.
/// @author nglunipro.ru


import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  dynamic obj = new Float64x2List(0);
  Expect.throws(() { obj.runtimeType = obj.runtimeType; },
          (e) => e is NoSuchMethodError);
}
