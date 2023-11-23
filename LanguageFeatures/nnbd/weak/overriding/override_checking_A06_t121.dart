// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If a class [C] in an opted-in library implements the same generic
/// class [I] more than once as [I0], .., [In], and at least one of the [Ii] is
/// not syntactically equal to the others, then it is an error if
/// [NNBD_TOP_MERGE(S0, ..., Sn)] is not defined where [Si] is [NORM(Ii)].
/// Otherwise, for the purposes of runtime subtyping checks, [C] is considered to
/// implement the canonical interface given by [NNBD_TOP_MERGE(S0, ..., Sn)].
///
/// @description Check that [NNBD_TOP_MERGE(Object*, dynamic*)] is [Object?]
///
/// @Issue 40481
/// @author iarkh@unipro.ru

// Requirements=nnbd-weak

import "../../../../Utils/expect.dart";
import "override_checking_A06_opted_out_lib.dart";

class C1 extends out_Object  implements out_dynamic {}
class C2 extends out_dynamic implements out_Object  {}

main() {
  Expect.isTrue(C1().f is dynamic Function(dynamic));
  Expect.isTrue(C2().f is dynamic Function(dynamic));
  Expect.runtimeIsType<dynamic Function(dynamic)>(C1().f);
  Expect.runtimeIsType<dynamic Function(dynamic)>(C2().f);
}
