// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// const Array<T extends NativeType>(
/// int dimension1,
///  [int dimension2,
///  int dimension3,
///  int dimension4,
///  int dimension5]
///  )
///  Const constructor to specify Array dimensions in Structs.
///
///  class MyStruct extends Struct {
///  @Array(8)
///  external Array<Uint8> inlineArray;
///
///  @Array(2, 2, 2)
///  external Array<Array<Array<Uint8>>> threeDimensionalInlineArray;
///  }
///  Do not invoke in normal code.
///
/// @description Checks that it is a compile error if Array annotation has a
/// wrong dimension
/// @author sgrekhov@unipro.ru

import "dart:ffi";

class MyStruct extends Struct {
  @Array(2)
//^^^^^^^^^
// [analyzer] unspecified

  external Array<Array<Int16>> a0;
//                             ^
// [cfe] unspecified
}

void main() {
  MyStruct? ms;
}
