// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if an extension application occurs in a
/// place where it is not the target expression of a simple or composite member
/// invocation. That is, the only valid use of an extension application is to
/// invoke members on it.
///
/// @description Check that it is a compile-time error if an extension
/// application occurs in a place where it is not the target expression of a
/// simple or composite member invocation.
/// @author sgrekhov@unipro.ru



class C {
}

extension Ext on C {
  C foo() => Ext(this);
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  C c = C();
  Ext(c).foo();
}
