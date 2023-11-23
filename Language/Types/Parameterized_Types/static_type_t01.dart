// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If S is the static type of a member m of G, then the static type
/// of the member m of G <A1, ..., An> is [A1, ..., An/T1, ..., Tn]S where
/// T1, ..., Tn are the formal type parameters of G.
/// @description Checks that static type of member m G<T1, T2> is [T1, T2]S
/// @author sgrekhov@unipro.ru


class A<T> {
}

class G<T1, T2> {
  G(this.m1, this.m2);
  A<T1> m1;
  A<T2> m2;
}

main() {
  G<int, String> c = new G<int, String>(new A<int>(), new A<String>());
  A<int> a1 = c.m1;
  A<String> a2 = c.m2;
}
