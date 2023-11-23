// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Evaluation of the is-expression e is T proceeds as follows:
/// The expression e is evaluated to a value v.
/// Then, if T is malformed or deferred type, a dynamic error occurs.
/// Otherwise, if the interface of the class of v is a subtype of T, the
/// is-expression evaluates to true.
/// Otherwise it evaluates to false.
/// @description Checks that if T is generic type and G is generic type with
/// less then n type parameters, then it is a compile error
/// @author msyabro

class G<T> {}

main() {
  new G() is G<int, bool>;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}
