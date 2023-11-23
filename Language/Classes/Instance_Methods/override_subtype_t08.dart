// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile error if an instance method m1 overrides an
/// instance member m2 and the type of m1 is not a subtype of the type of m2.
/// @description Checks that a compile error is produced if m1 is not a subtype
/// of m2 because their respective required parameter types are not mutually 
/// assignable. Test type aliases
/// @author sgrekhov@unipro.ru

class A {
  foo(int x) {}
}
typedef AAlias = A;

class C extends AAlias {
  foo(String x) {
//^
// [analyzer] unspecified
// [cfe] unspecified
    return x.toString();
  }
}

main() {
  new A().foo(2);
  new C().foo("1");
}
