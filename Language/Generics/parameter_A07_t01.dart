// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A type parameter cannot be used to name a constructor in an
/// instance creation expression
/// @description Checks that class type parameter cannot be used in an instance
/// creation expression.
/// @author iarkh@unipro.ru


class A<T> {
  test() {
    T();
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
}
