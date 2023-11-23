// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Any expression of the form e1(args) or e1<types>(args) where e1
/// does not denote a method, and where the static type of e1 is not a function
/// type, an interface type declaring a call method, or dynamic, will currently
/// be a compile-time error. If the static type of e1 is an interface type
/// declaring a call getter, then this stays a compile-time error. Otherwise we
/// check for extensions applying to the static type of e1 and declaring a call
/// member. If one such most specific extension exists, and it declares a call
/// extension method, then the expression is equivalent to e1.call(args) or
/// e1.call<typeS>(args). Otherwise it is still a compile-time error.
///
/// @description Check that the most specific extension with the 'call' method is
/// taken
/// @author sgrekhov@unipro.ru


import "../../Utils/expect.dart";

extension on int {
  String call(num v) => "My name is int($v)";
}

extension on num {
  String call(num v) => "My name is num($v)";
}

main() {
  Expect.equals("My name is int(10)", 1(10));
  Expect.equals("My name is int(3.14)", 1(3.14));
  Expect.equals("My name is num(10)", 1.0(10));
  Expect.equals("My name is num(3.14)", 1.0(3.14));
}
