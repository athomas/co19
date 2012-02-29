/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A variable declaration statement var id; or var id = e; introduces 
 * a new variable named id with static type Dynamic into the innermost enclosing scope.
 * @description Checks that a variable declaration statement var id; introduces
 * a new variable id with static type Dynamic into the innermost enclosing scope.
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */

class C {}

main() {
  var id;
  Expect.isTrue(id is Dynamic);
  id = false;
  id = "";
  id = 2;
  id = new C();
  id = (){};
}
