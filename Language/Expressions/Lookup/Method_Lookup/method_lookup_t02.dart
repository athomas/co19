// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The result of a lookup of method m in class C with respect to
/// library L is: If C declares a concrete instance method named m that is
/// accessible to L, then that method is the result of the lookup, and we say
/// that the method was looked up in c. Otherwise, if C has a superclass S, then
/// the result of the lookup is the result of looking up m in S with respect to
/// L. Otherwise, we say that the method lookup has failed.
/// @description Checks that the method m in the superclass is not selected if
/// method m exists in the class C.
/// @author kaigorodov

import '../../../../Utils/expect.dart';

class S {
 int m() => 12346;
}

class C extends S {
 int m() => 12345;
}

main()  {
  var o = new C();
  Expect.equals(12345, o.m());
}
