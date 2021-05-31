// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All field declarations in a Union subclass declaration must
/// either have type int or float and be annotated with a NativeType
/// representing the native type, or must be of type Pointer.
///
/// @description Checks that it is a compile error if int field is annotated
/// as Float or Double
/// @author sgrekhov@unipro.ru

import "dart:ffi";

class U1 extends Union {
  @Double()
//^^^^^^^^^
// [analyzer] unspecified
  external int x;
//             ^
// [cfe] unspecified
}

class U2 extends Union {
  @Float()
//^^^^^^^^^
// [analyzer] unspecified
  external int x;
//             ^
// [cfe] unspecified
}

void main() {
  U1? u1;
  U2? u2;
}
