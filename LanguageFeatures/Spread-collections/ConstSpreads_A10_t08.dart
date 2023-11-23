// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion From the Unified collection Spec:
/// A [spreadElement] starting with [...?] is a constant element if its
/// expression is constant and it evaluates to [null] or a constant [List], [Set]
/// or [Map] instance originally created by a list, set or map literal. It is a
/// potentially constant element if the expression is potentially constant
/// expression.
/// @description: Checks that constant set spread [...?] element can be constant
/// list or set or [null].
/// @author iarkh@unipro.ru


const List? l = [];
const Set? s = {11};
const n = null;

main() {
  const Set res1 = const {...?l};
  const Set res2 = const {...?s};
  const Set res3 = const {...?n};
}
