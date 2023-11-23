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
/// @description Check that error occurs as a result of the following cases:
///    [NNBD_TOP_MERGE(dynamic*, FutureOr<int>).
///    [NNBD_TOP_MERGE(dynamic*, FutureOr<int?>).
///
/// @author iarkh@unipro.ru

// Requirements=nnbd-weak

import "dart:async";
import "override_checking_A06_opted_out_lib.dart";

class B1 extends A_OUT<FutureOr<int>> {}
class B2 extends A_OUT<FutureOr<int?>> {}

class C1 extends out_dynamic implements B1 {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

class C2 extends B1 implements out_dynamic {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

class C3 extends out_dynamic implements B2 {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

class C4 extends B2 implements out_dynamic {}
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

main() {}
