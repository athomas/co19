// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If more than one extension applies to a specific member
/// invocation, then we resort to a heuristic to choose one of the extensions to
/// apply. If exactly one of them is "more specific" than all the others, that
/// one is chosen. Otherwise it is a compile-time error.
///
/// An extension with [on] type clause [T1] is more specific than another
/// extension with [on] type clause [T2] iff
///
///   1. The latter extension is declared in a platform library, and the former
///      extension is not
///   2. they are both declared in platform libraries or both declared in
///      non-platform libraries, and
///   3. the instantiated type (the type after applying type inference from the
///      receiver) of [T1] is a subtype of the instantiated type of [T2] and
///      either
///   4. not vice versa, or
///   5. the instantiate-to-bounds type of [T1] is a subtype of the
///      instantiate-to-bounds type of [T2] and not vice versa.
/// @description Check that An extension with [on] type clause [T1] is more
/// specific than another extension with [on] type clause [T2] if instantiated
/// type of [T1] is a subtype if instantiated type of [T2] and i-2-b type of [T1]
/// is a subtype of the instantiate type of [T2]
/// @author iarkh@unipro.ru
/// @issue 43211

import "../../Utils/expect.dart";

class A<X extends A<X>?> {}

extension ext1<X extends A<X>?> on A<X?> {
  bool get checkme => false;
}

extension ext2<X extends A<Null>?> on A<X?> {
  bool get checkme => true;
}

main() {
  var a = new A<Null>();
  Expect.isTrue(a.checkme);
}

