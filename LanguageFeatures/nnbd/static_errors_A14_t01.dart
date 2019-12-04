/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error to apply an expression of type Never in the
 * function position of a function call.
 *
 * @description Check that it is an error to apply an expression of type Never
 * in the function position of a function call.
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

void test(var x) {
  if (x is Never) {
    x();
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    x(1);
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    x("1");
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  test(null);
}
