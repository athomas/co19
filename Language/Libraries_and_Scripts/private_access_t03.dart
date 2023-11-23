// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Libraries are units of privacy. A private declaration declared
/// within a library L can only be accessed by code within L. Any attempt to
/// access a private member declaration from outside L will cause a method,
/// getter or setter lookup failure.
/// @description Checks that an attempt to access a private static member from
/// outside L results in a compile error.
/// @author vasya

import "private_access_t03_lib.dart" as lib;

main() {
  lib.C._x;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}
