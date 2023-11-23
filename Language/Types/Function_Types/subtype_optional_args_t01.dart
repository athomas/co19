// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A function type (T1,...Tk,[Tk+1,...,Tn+m]) -> T is a subtype of
/// the function type (S1,...,Sk+j,[Sk+j+1,...,Sn]) -> S, if all of the following
/// conditions are met:
/// 1. Either
///    • S is void, or
///    • T <=> S.
/// 2. ∀i ∈ 1..n, Ti ⇐⇒ Si.
/// @description Checks that this statement is true for functions with a single
/// positional optional parameter (class, generic, function, Dynamic).
/// @author iefremov

import "../../../Utils/expect.dart";

class A {}
class B implements A {}
class C implements B {}
class D implements C {}

typedef t1([B? a]);
typedef t2([C? c]);
typedef t3([int? i]);
typedef t4([var v]);
typedef t5([Map? m]);
typedef t6([Map<int, num>? m]);
typedef t7([t1? f]);
typedef t8([Object? a]);

typedef okWithT1_1([A? a]);
typedef okWithT1_2([B? a]);
typedef okWithT1_3([C? a]);
typedef okWithT1_4([D? a]);

main() {
  Expect.isTrue(([A? a]) {} is t1);
  Expect.isTrue(([B? a]) {} is t1);
  Expect.isFalse(([C? a]) {} is t1);
  Expect.isFalse(([D? a]) {} is t1);
  Expect.isTrue(([Object? a]) {} is t1);
  Expect.isTrue(([var a]) {} is t1);
  Expect.runtimeIsType<t1>(([A? a]) {});
  Expect.runtimeIsType<t1>(([B? a]) {});
  Expect.runtimeIsNotType<t1>(([C? a]) {});
  Expect.runtimeIsNotType<t1>(([D? a]) {});
  Expect.runtimeIsType<t1>(([Object? a]) {});
  Expect.runtimeIsType<t1>(([var a]) {});

  Expect.isTrue(([A? c]) {} is t2);
  Expect.isTrue(([B? c]) {} is t2);
  Expect.isTrue(([C? c]) {} is t2);
  Expect.isFalse(([D? c]) {} is t2);
  Expect.isTrue(([Object? c]) {} is t2);
  Expect.isTrue(([var c]) {} is t2);
  Expect.runtimeIsType<t2>(([A? a]) {});
  Expect.runtimeIsType<t2>(([B? a]) {});
  Expect.runtimeIsType<t2>(([C? a]) {});
  Expect.runtimeIsNotType<t2>(([D? a]) {});
  Expect.runtimeIsType<t2>(([Object? a]) {});
  Expect.runtimeIsType<t2>(([var a]) {});

  Expect.isTrue(([num? i]) {} is t3);
  Expect.isTrue(([int? i]) {} is t3);
  Expect.isTrue(([Object? i]) {} is t3);
  Expect.isTrue(([var i]) {} is t3);
  Expect.runtimeIsType<t3>(([num? a]) {});
  Expect.runtimeIsType<t3>(([int? a]) {});
  Expect.runtimeIsType<t3>(([Object? a]) {});
  Expect.runtimeIsType<t3>(([var a]) {});

  Expect.isFalse(([A? v]) {} is t4);
  Expect.isFalse(([B? v]) {} is t4);
  Expect.isFalse(([C? v]) {} is t4);
  Expect.isFalse(([D? v]) {} is t4);
  Expect.isTrue(([Object? v]) {} is t4);
  Expect.isTrue(([var v]) {} is t4);
  Expect.isFalse(([num? v]) {} is t4);
  Expect.isFalse(([int? v]) {} is t4);
  Expect.isFalse(([Map? v]) {} is t4);
  Expect.isFalse(([Map<List<Map<List, List<int>>>, List>? v]) {} is t4);
  Expect.isFalse(([List? v]) {} is t4);
  Expect.isFalse(([t8? v]) {} is t4);
  Expect.isFalse(([t7? v]) {} is t4);
  Expect.runtimeIsNotType<t4>(([A? a]) {});
  Expect.runtimeIsNotType<t4>(([B? a]) {});
  Expect.runtimeIsNotType<t4>(([C? a]) {});
  Expect.runtimeIsNotType<t4>(([D? a]) {});
  Expect.runtimeIsType<t4>(([Object? a]) {});
  Expect.runtimeIsType<t4>(([var a]) {});
  Expect.runtimeIsNotType<t4>(([num? a]) {});
  Expect.runtimeIsNotType<t4>(([int? a]) {});
  Expect.runtimeIsNotType<t4>(([Map? a]) {});
  Expect.runtimeIsNotType<t4>(([Map<List<Map<List, List<int>>>, List>? v]) {});
  Expect.runtimeIsNotType<t4>(([List? a]) {});
  Expect.runtimeIsNotType<t4>(([t8? a]) {});
  Expect.runtimeIsNotType<t4>(([t7? a]) {});

  Expect.isTrue(([Map? m]) {} is t5);
  Expect.isFalse(([Map<List, t8>? m]) {} is t5);
  Expect.isTrue(([Object? m]) {} is t5);
  Expect.isTrue(([var m]) {} is t5);
  Expect.isFalse(([Map<List, List>? m]) {} is t5);
  Expect.isFalse(([Map<int, t8>? m]) {} is t5);
  Expect.runtimeIsType<t5>(([Map? a]) {});
  Expect.runtimeIsNotType<t5>(([Map<List, t8>? a]) {});
  Expect.runtimeIsType<t5>(([Object? a]) {});
  Expect.runtimeIsType<t5>(([var a]) {});
  Expect.runtimeIsNotType<t5>(([Map<List, List>? a]) {});
  Expect.runtimeIsNotType<t5>(([Map<int, t8>? a]) {});

  Expect.isTrue(([Map<num, num>? m]) {} is t6);
  Expect.isFalse(([Map<int, int>? m]) {} is t6);
  Expect.isTrue(([Map? m]) {} is t6);
  Expect.isTrue(([Object? m]) {} is t6);
  Expect.isTrue(([var m]) {} is t6);

  Expect.isFalse(([okWithT1_1? f]) {} is t7);
  Expect.isTrue(([okWithT1_2? f]) {} is t7);
  Expect.isTrue(([okWithT1_3? f]) {} is t7);
  Expect.isTrue(([okWithT1_4? f]) {} is t7);

  Expect.isFalse(([A? a]) {} is t8);
  Expect.isFalse(([B? a]) {} is t8);
  Expect.isFalse(([C? a]) {} is t8);
  Expect.isFalse(([D? a]) {} is t8);
  Expect.isTrue(([Object? a]) {} is t8);
  Expect.isTrue(([var a]) {} is t8);
  Expect.isFalse(([num? a]) {} is t8);
  Expect.isFalse(([int? a]) {} is t8);
  Expect.isFalse(([Map? a]) {} is t8);
  Expect.isFalse(([Map<List<Map<List, List<int>>>, List>? a]) {} is t8);
  Expect.isFalse(([List? a]) {} is t8);
  Expect.runtimeIsNotType<t8>(([A? a]) {});
  Expect.runtimeIsNotType<t8>(([B? a]) {});
  Expect.runtimeIsNotType<t8>(([C? a]) {});
  Expect.runtimeIsNotType<t8>(([D? a]) {});
  Expect.runtimeIsType<t8>(([Object? a]) {});
  Expect.runtimeIsType<t8>(([var a]) {});
  Expect.runtimeIsNotType<t8>(([num? a]) {});
  Expect.runtimeIsNotType<t8>(([int? a]) {});
  Expect.runtimeIsNotType<t8>(([Map? a]) {});
  Expect.runtimeIsNotType<t8>(([Map<List<Map<List, List<int>>>, List>? v]) {});
  Expect.runtimeIsNotType<t8>(([List? a]) {});
}
