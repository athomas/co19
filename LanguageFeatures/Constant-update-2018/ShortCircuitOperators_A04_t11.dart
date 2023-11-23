// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Finally, the conditional [?]/[:] operator only evaluates one of
/// its branches, depending on whether the condition expression evaluates to
/// [true] or [false]. The other branch must also be a potentially constant
/// expression.
/// @description Checks that conditional operator [?]/[:] rejects the first
/// operand if condition is [false] for potentially constant expressions.
/// @author iarkh@unipro.ru

import "../../Utils/expect.dart";

class MyClass {
  final int res;
  const MyClass(dynamic test) : res = (false ? test.length : 5);
}

main() {
  const MyClass c = MyClass(null);
  Expect.equals(5, c.res);
}
