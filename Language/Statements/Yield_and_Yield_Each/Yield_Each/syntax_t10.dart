// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The yield-each statement adds a series of values to the result
/// of a generator function.
///  yieldEachStatement:
///    yield* expression ‘;’
///  ;
///
/// @description Check that it is compile error if ';' is missing
/// in yield-each statement in asynchronous generator function
///
/// @author a.semenov@unipro.ru

import 'dart:async';

Stream<int> test() async* {
  yield* new Stream<int>.fromIterable([1])
//                                       ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  test();
}
