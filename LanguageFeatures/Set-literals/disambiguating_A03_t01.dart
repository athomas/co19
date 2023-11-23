// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let e be a setOrMapLiteral.
/// If e has a context C, and the base type of C is Cbase (that is, Cbase is C
/// with all wrapping FutureOrs removed), and Cbase is not ?, then let S be the
/// greatest closure.
/// ...
/// if S is defined and is a subtype of Map<Object, Object> and S is not a
/// subtype of Iterable<Object> then e is a map literal.
///
/// @description Checks that if s is an emptySetOrMapLiteral with no
/// typeArguments, then if S is a subtype of Map<Object, Object> and S is not a
/// subtype of Iterable<Object> then e is a map literal.
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

Object test() => {};

main() {
  Expect.isTrue(test() is Map);
}
