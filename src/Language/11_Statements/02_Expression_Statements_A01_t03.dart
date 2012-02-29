/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression statement consists of an expression.
 * expressionStatement:
 * expression? ';' |
 * ; 
 * Execution of an expression statement e; proceeds by evaluating e.
 * @description Checks that an empty expression statement consisting of just a semicolon is perfectly valid.
 * @author rodionov
 * @reviewer iefremov
 */

main() {
  ;
  ;;;
}

