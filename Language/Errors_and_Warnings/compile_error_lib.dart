// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.


library compile_error_lib;

int f() {
  return 1;
}
var a = ;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
