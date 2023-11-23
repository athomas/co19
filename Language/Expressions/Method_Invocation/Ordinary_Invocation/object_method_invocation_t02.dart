// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error to invoke any of the methods of class
/// Object on a prefix object or on a constant type literal that is immediately
/// followed by the token ‘.’.
/// @description Checks that there is a compile error if any of the methods of
/// class Object is invoking on a constant type literal.
/// @issue #25496
/// @author ngl@unipro.ru

class A {}

main() {
  A.toString();
//  ^
// [analyzer] unspecified
// [cfe] unspecified
}
