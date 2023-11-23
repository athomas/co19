// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion abstract void addAll(Iterable<E> iterable)
/// Throws an UnsupportedError if this list is not extensible.
/// @description Checks that UnsupportedError is thrown
/// if the list is not extendable.
/// @author kaigorodov

library addAll_A02_t02;

import "../../../Utils/expect.dart";

test(List<E> create<E>([int length, E fill])) {
  Expect.throws(() {create<int?>(1, 0).add(null);}, (e) => e is UnsupportedError);
  Expect.throws(() {create<int?>(100, 0).add(null);}, (e) => e is UnsupportedError);
}
