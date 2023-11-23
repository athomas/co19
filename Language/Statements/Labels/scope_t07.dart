// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The scope of a label that labels a statement s is s. The scope of
/// a label that labels a case clause of a switch statement s is s.
/// @description Checks that it is not an error when the same label identifier is
/// used with more than one statement within the same lexical scope.
/// @author rodionov


main() {
  label: var x = 1;
  label: x = 2;
  x = 3;
  label: x = 4;
}
