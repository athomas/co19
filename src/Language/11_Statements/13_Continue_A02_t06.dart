/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let sc be a continue statement. If sc is of the form continue L;, 
 * then let sE be the the innermost labeled statement or case clause with label L 
 * enclosing sc. If sc is of the form continue; then let sE be the innermost do (11.7),
 * for (11.5) or while (11.6) statement enclosing sc. It is a compile-time error if no
 * such statement or case clause sE exists within the innermost function in which sc occurs.
 * @description Checks that it is a compile-time error when there's no appropriate loop
 * statement or case clause within the innermost function containing the continue statement.
 * @compile-error
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 * @needsreview this test actually contradicts the current spec, but that is expected to be
 * amended in v0.08
 * @needsreview issue 143
 */


main() {
  try {
    L: if (true) {
      continue L;
    }
  } catch(var x) {}
}
