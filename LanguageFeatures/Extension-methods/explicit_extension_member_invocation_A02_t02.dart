// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if the corresponding class constructor
/// invocation would be a compile-time error.
///
/// @description Check that it is a compile-time error if the corresponding class
/// constructor invocation would be a compile-time error.
/// @author sgrekhov@unipro.ru



class C {
  String name = "My name is C";
}

extension Ext on C {
  String checkme() => this.name;
}

main() {
  C c = new C();
  Ext(Ext(c)).checkme();
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
