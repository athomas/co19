// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a static type warning if the type of e may not be assigned
/// to either bool or () -> bool.
/// @description Checks that it is a compile error if the static type
/// of e is Function (conditional expression).
/// @author rodionov


main() {
  assert (true ? (() => true) : ((var x) => 1));
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}
