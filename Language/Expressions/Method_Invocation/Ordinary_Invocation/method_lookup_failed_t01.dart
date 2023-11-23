// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If the method lookup has failed, then let g be the result of
/// looking up getter m in vo with respect to L. If vo is an instance of Type
/// but o is not a constant type literal, then if g is a getter that forwards
/// to a static getter, getter lookup fails. If the getter lookup succeeded,
/// let vg be the value of the getter invocation o.m. Then the value of i is
/// the result of invoking the static method Function.apply() with arguments
/// v.g, [o1, ..., on], {xn+1: on+1, ..., xn+k: on+k }.
/// If getter lookup has also failed, then a new instance im of the predefined
/// class Invocation is created, such that:
/// • im.isMethod evaluates to true.
/// • im.memberName evaluates to symbol m.
/// • im.positionalArguments evaluates to an immutable list with the same values
///   as [o1, ..., on].
/// • im.namedArguments evaluates to an immutable map with the same keys and
///   values as {xn+1: on+1, ..., xn+k: on+k}.
/// Then the method noSuchMethod() is looked up in vo and invoked with argument
/// im, and the result of this invocation is the result of evaluating i.
/// @description Checks that if vg is a function, it is executed with respect to
/// the bindings of the evaluated argument list.
/// @author msyabro

import '../../../../Utils/expect.dart';

class TestException {}

class C {
  C(this.func);
  var func;
}

main()  {
  var o = new C((exception) {throw exception;});
  var e0 = new TestException();
  try {
    o.func(e0);
    Expect.fail("Exception expected");
  } on TestException catch (e) {
    Expect.equals(e0, e);
  }
}
