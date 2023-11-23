// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In a setOrMapLiteral collection, the inferred type of an element
/// is a set element type T, a pair of a key type K and a value type V, or both.
/// It is computed relative to a context type P:
///
/// If collection is unambiguously a set literal, then P is Set<Pe> where Pe is
/// determined by downwards inference, and may be ? if downwards inference does
/// not constrain it.
///
/// @description Checks that if collection is unambiguously a set literal, then P
/// is Set<Pe> where Pe is determined by downwards inference and may be ?
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

void foo<X extends num>(Set<X> s) {
  Expect.isTrue(s is Set<int>);
}

main() {
  foo({1});
  foo({...{3, 1, 4}});
  foo({if (2 > 1) ...{3, 1, 4}});
  foo({if (2 < 1) ...{3, 1, 4}});
}
