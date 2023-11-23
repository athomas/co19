// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion True literal: If N is the literal true, then:
///  Let true(N) = before(N).
///  Let false(N) = unreachable(before(N)).
///
/// @description Checks reachability after true literal
///
/// @author sgrekhov@unipro.ru


main() {
  late int i;
  true ? "nothing" : i = 42;  // Variable is initialized in a dead code. This leaves it definitely unassigned
  i;  // It is an error to read a local late variable when it is definitely unassigned.
//^
// [analyzer] unspecified
// [cfe] unspecified
}
