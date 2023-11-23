// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All types reified in legacy libraries are reified as legacy types.
/// @description Check that runtime type of the object of the class imported from
/// opted to legacy library is a legacy type.
/// @author iarkh@unipro.ru

// Requirements=nnbd-weak
import "../../../Utils/expect.dart";
import "type_reification_legacy_lib.dart";

main() {
  var a = A();
  Expect.equals(A, a.runtimeType);
  Expect.isTrue(a is A);
  Expect.isTrue(a is A?);
  Expect.isFalse(a is A1);
  Expect.isFalse(a is A1?);
  Expect.runtimeIsType<A>(a);
  Expect.runtimeIsType<A?>(a);
  Expect.runtimeIsNotType<A1>(a);
  Expect.runtimeIsNotType<A1?>(a);

  var b1 = B();
  Expect.equals(typeOf<B<dynamic>>(), b1.runtimeType);
  Expect.isTrue(b1 is B);
  Expect.isTrue(b1 is B?);
  Expect.isTrue(b1 is B<Object?>);
  Expect.isFalse(b1 is B<A>);
  Expect.runtimeIsType<B>(b1);
  Expect.runtimeIsType<B?>(b1);
  Expect.runtimeIsType<B<Object?>>(b1);
  Expect.runtimeIsNotType<B<A>>(b1);

  var b2 = B<A>();
  Expect.equals(typeOf<B<A>>(), b2.runtimeType);
  Expect.isTrue(b2 is B<A>);
  Expect.isTrue(b2 is B<A>?);
  Expect.isTrue(b2 is B);
  Expect.isTrue(b2 is B?);
  Expect.isTrue(b2 is B<A?>);
  Expect.isFalse(b2 is B<A1>);
  Expect.runtimeIsType<B<A>>(b2);
  Expect.runtimeIsType<B<A>?>(b2);
  Expect.runtimeIsType<B>(b2);
  Expect.runtimeIsType<B?>(b2);
  Expect.runtimeIsType<B<A?>>(b2);
  Expect.runtimeIsNotType<B<A1>>(b2);
}
