// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a class has both a getter and a
/// method with the same name. This restriction holds regardless of whether the 
/// getter is defined explicitly or implicitly, or whether the getter or the 
/// method are inherited or not.
/// @description Checks that a compile-time error is produced if a class has 
/// an explicitly declared getter inherited from a superclass and a method with 
/// the same name. Test type alias
/// @author sgrekhov@unipro.ru

class A {
  get foo => "foo";
}
typedef AAlais = A;

class C extends AAlias {
//              ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  foo() => "foo()";
}

main() {
  new C().foo();
}
