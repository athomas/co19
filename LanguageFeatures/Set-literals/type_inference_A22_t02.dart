// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Finally, we define inference on a setOrMapLiteral collection as
/// follows:
/// ...
/// Else, if collection is unambiguously a map literal where P is Map<Pk, Pv>:
///
/// If Pk is ? then the static key type of collection is K where K is the least
/// upper bound of the inferred key types of the elements.
///
/// @description Checks that if collection is unambiguously a map literal and Pk
/// is ? then the static key type of collection is K where K is the least upper
/// bound of the inferred key types of the elements.
/// @author sgrekhov@unipro.ru
/// @issue 43280

import "../../Utils/expect.dart";

class C<K extends num, V> {
  test(K k, V v) {
    var m = {k: v, 1: 2};
    Expect.isTrue(m is Map<num, Object?>);
    Expect.isFalse(m is Map<num, int?>);
    Expect.runtimeIsType<Map<num, Object?>>(m);
    Expect.runtimeIsNotType<Map<num, int?>>(m);
  }
}

main() {
  C<int, int?>().test(3, 4);
  C<int, int?>().test(3, null);
}
