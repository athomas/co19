// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void exit(int code)
/// Exit the Dart VM process immediately with the given exit code.
/// @description Checks that calling [exit(null)] causes compile error.
/// @author iarkh@unipro.ru

import "dart:io";

main(List<String> args) {
  exit(null);
//     ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
