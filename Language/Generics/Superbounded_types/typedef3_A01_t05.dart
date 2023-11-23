// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Any use of a type [T] which is not well-bounded is a
/// compile-time error.
/// @description Checks that compile error is not thrown when non-function type
/// alias variable with well bounded type parameter is declared
/// @author iarkh@unipro.ru

class A<T> {}

typedef B<X> = A<X>;

main() {
  B b1;
  B<A<dynamic>> b2;
  B<A<Object?>> b3;
  B<A<Null>> b4;
  B<A<Never>> b5;
  B<A<void>> b6;
}
