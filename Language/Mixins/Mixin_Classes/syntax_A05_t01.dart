// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// ⟨mixinApplicationClass⟩ ::=
///     ⟨identifier⟩ ⟨typeParameters⟩? ‘=’ ⟨mixinApplication⟩ ‘;’
/// ⟨mixinApplication⟩ ::= ⟨typeNotVoid⟩ ⟨mixins⟩ ⟨interfaces⟩?
/// ...
/// A clause of the form S with M1, ..., Mn with name N defines a
/// class as follows:
/// If there is only one mixin (n = 1), then S with M1 defines the class yielded
/// by the mixin application of the mixin of M1 to the class denoted by S with
/// name N.
/// If there is more than one mixin (n > 1), then let X be the class defined by
/// S with M1, ..., Mn−1 with name F, where F is a fresh name, and make X
/// abstract. Then S with M1, ..., Mn defines the class yielded by the mixin
/// application of the mixin of Mn to the class X with name N.
///
/// @description Checks that it is a compile-time error if there are members
/// with conflicting types
/// @issue 26409
/// @author sgrekhov@unipro.ru

class A {
  int a = 0;
}

class S extends A {
}

mixin class M {
  int a = 42;
}

class C extends S with M {
  String a = "";
//       ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  new C();
}
