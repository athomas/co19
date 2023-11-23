// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion classDefinition:
///   metadata abstract? class identifier typeParameters? (superclass mixins?)?
/// interfaces? ‘{’ (metadata classMemberDefinition)* ‘}’ |
///   metadata abstract? class mixinApplicationClass
/// ;
/// ...
/// It is a compile-time error if the superclass of a class C is specified as a
/// superinterface of C.
/// ...
/// @description Checks that it is a compile-time error if the superclass of a
/// class C is specified as a superinterface of C.
/// @author sgrekhov@unipro.ru
/// @issue dart-lang/co19#129
/// @issue 31624

class X = A with B implements A;
//                            ^
// [analyzer] unspecified
// [cfe] unspecified

abstract class A {}
class B {}

main() {
  new X();
}
