// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A simple member invocation on a target expression X is an
/// expression of one of the forms:
/// Member invocation on target X	     Corresponding member name
///   -X                                     unary-
/// @description Check explicit extension member invocation in form of -X
/// @author sgrekhov@unipro.ru



class C {
  String operator -() => "Lily was here";
}

extension Extension1 on C {
  String operator ~() => "Show must go on";
}

main() {
  C c = new C();
  -Extension1(c);
//^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
