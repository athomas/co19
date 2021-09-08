// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For an expression of the form e<typeArgs>, which is not followed
/// by an argument list (that would turn it into a generic function invocation),
/// the meaning of e<typeArgs> depends on the expression e:
/// ...
/// - If e has a static type which is a generic callable object type (a
/// non-function type with a generic method named call), then e<typeArgs> is
/// equivalent to the instantiated method-tear off e.call<typeArgs>.
/// - Otherwise, if e has a static type which is a generic function type, then
/// e<typeArgs> is equivalent to the instantiated method-tear off
/// e.call<typeArgs>
///
/// @description Checks that generic instantiation of a 'call' method
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

class C {
  T call<T>(T value) => value;
}

main() {
  var f = C()<int>;
  f("Lily was here");
//  ^
// [analyzer] undefined
// [cfe] undefined
}
