// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define inherited(J, K) to be
/// the set of members m such that all of the following hold:
/// • m is accessible to K and
/// • A is a direct superinterface of J and either
/// – A declares a member m or
/// – m is a member of inherited(A, K).
/// • m is not overridden by J.
/// ...
/// If some but not all of the mi, 1 ≤ i ≤ k are getters none of the mi are
/// inherited, and a static warning is issued.
/// Otherwise, if the static types T1,...,Tk of the members m1,...,mk are not
/// identical, then there must be a member mx such that Tx <: Ti, 1 ≤ x ≤ k for
/// all i ∈ 1..k, or a static type warning occurs.
/// @description Checks that if all inherited members with the same name are
/// getters and their static types are not identical, but there is a getter
/// such that its type is subtype of types of all other getters then, anyway,
/// a compile error occurs
/// @author sgrekhov@unipro.ru


abstract class SI1 {
  int get m1;
  int get m2;
  List<int> get m3;
  int get m4;
}

abstract class SI2 {
  bool get m1;
  double get m2;
  List<String> get m3;
  bool get m4;
}

abstract class SI3 {
  Object get m1; // subtype of m1 in SI1 and SI2
  num get m2;   // subtype of m2 in SI1 and SI2
  List get m3;  // subtype of m3 in SI1 and SI2
  get m4;       // subtype of m4 in SI1 and SI2
}

abstract class I implements SI1, SI2, SI3 {
//             ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  I? i = null;
}
