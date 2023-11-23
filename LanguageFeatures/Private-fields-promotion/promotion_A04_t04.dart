// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An instance field is promotable if all the following conditions
/// hold:
/// - It refers to a field (not a getter)
/// - The field is private
/// - The field is final
/// - There is no getter with the same name elsewhere in the library
/// - There is no non-final field with the same name elsewhere in the library
/// - There is no implicit noSuchMethod forwarder with the same name elsewhere
///   in the library.
///
/// @description Checks that if there is an implicit `noSuchMethod` forwarder of
/// a setter with the same basename then the field is promotable
/// @author sgrekhov22@gmail.com

class A {
  final int? _x = 42;

  void testA() {
    if (_x != null) {
      _x.isOdd;
    }
  }
}

class C {
  void set _x(int? v);

  dynamic noSuchMethod(Invocation inv) {}
}

main() {
  A a = A();
  if (a._x is int) {
    a._x.isEven;
  }
  a.testA();
}
