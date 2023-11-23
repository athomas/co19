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
/// @description Check that result of [NNBD_TOP_MERGE] for the cases:
///   NNBD_TOP_MERGE(dynamic*, dynamic*) = dynamic
///   NNBD_TOP_MERGE(void*, void*) = void
///   NNBD_TOP_MERGE(Null*, Null*) = Null
///
/// @author iarkh@unipro.ru

// Requirements=nnbd-weak

import "../../../../Utils/expect.dart";
import "override_checking_A06_opted_out_lib.dart";

class in_dynamic extends out_dynamic implements out_dynamic1 {}
class in_void extends out_void implements out_void1 {}
class in_Null extends out_Null implements out_Null1 {}

main() {
  Expect.isTrue(in_dynamic().f is dynamic Function(dynamic));
  Expect.isTrue(in_void().f is void Function(void));
  Expect.isTrue(in_Null().f is Null Function(Null));
  Expect.runtimeIsType<dynamic Function(dynamic)>(in_dynamic().f);
  Expect.runtimeIsType<void Function(void)>(in_void().f);
  Expect.runtimeIsType<Null Function(Null)>(in_Null().f);
}
