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
/// @description Check that it is a compile error if there is no most specific
/// extension with the call method
/// @author sgrekhov@unipro.ru



extension on Iterable<int> {
  String call(num v) => "My name is Iterable:$v";
}

extension on List<num> {
  String call(num v) => "My name is List:$v";
}

main() {
  [3, 1, 4](10);
//^
// [analyzer] unspecified
// [cfe] unspecified
}
