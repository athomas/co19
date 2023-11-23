// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The iterable implementation must comply with the contract of
/// Iterable and should not take any steps identiﬁed as exceptionally efficient
/// in that contract.
///    The contract explicitly mentions a number of situations where certain
///  iterables could be more efficient than normal. For example, by precomputing
///  their length. Normal iterables must iterate over their elements to
///  determine their length. This is certainly true in the case of a synchronous
///  generator, where each element is computed by a function. It would not be
///  acceptable to pre-compute the results of the generator and cache them,
///  for example.
///
/// @description Check that method Iterable.elementAt() called on Iterable
/// instance, returned by synchronous generator, iterates through elements
/// sequentially.
///
/// @author a.semenov@unipro.ru


import '../../../Utils/expect.dart';

int yielded = 0;

Iterable test() sync* {
  for (int i = 0; i < 16; i++) {
    var x = 1 << i;
    yielded += x;
    yield x;
  }
}

main() {
  yielded = 0;
  var iterable = test();
  Expect.equals(1, iterable.elementAt(0));
  Expect.equals(1, yielded);

  yielded = 0;
  Expect.equals(128, iterable.elementAt(7));
  Expect.equals(0xff, yielded);

  yielded = 0;
  Expect.equals(32768, iterable.elementAt(15));
  Expect.equals(0xffff, yielded);
}
