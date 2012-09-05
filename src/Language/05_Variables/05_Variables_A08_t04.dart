/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A top-level variable is implicitly static. It is a compile-time error to preface
 * a top level variable declaration with the built-in identifier static.
 * @description Checks that it is a compile-time error if a top level final variable declaration
 * is prefaced with the built-in identifier static.
 * @compile-error
 * @author msyabro
 * @reviewer iefremov
 */

static final foo = 1; // error

main() {
  try {
    print(foo);
  } catch(ok) {}
}
