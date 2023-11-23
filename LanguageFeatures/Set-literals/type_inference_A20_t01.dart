// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Finally, we define inference on a setOrMapLiteral collection as
/// follows:
///
/// If collection is unambiguously a set literal:
///
/// If P is ? then the static type of collection is Set<T> where T is the least
/// upper bound of the inferred set element types of the elements.
///
/// @description Checks that if collection is unambiguously a set literal and P
/// is ? then the static type of collection is Set<T> where T is the least upper
/// bound of the inferred set element types of the elements
/// @author sgrekhov@unipro.ru
/// @issue 43280

import "../../Utils/expect.dart";

class C<X> {
  test(X x) {
    var v = {x, 1, 2};
    Expect.isTrue(v is Set<Object?>);
    Expect.isFalse(v is Set<int?>);
    Expect.runtimeIsType<Set<Object?>>(v);
    Expect.runtimeIsNotType<Set<int?>>(v);
  }
}

main() {
  C<int?>().test(42);
  C<int?>().test(null);
}
