// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if an extension type has a
/// non-extension superinterface whose transitive alias expansion is a type
/// variable, a deferred type, any top type (including dynamic and void), the
/// type Null, any function type, the type Function, any record type, the type
/// Record, or any type of the form T? or FutureOr<T> for any type T.
///
/// @description Checks that it is a compile-time error if an extension type
/// has a non-extension superinterface whose transitive alias expansion is a
/// deferred type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "extension_type_lib.dart" deferred as d;

extension type ET1(d.A id) implements d.A {}
//                                    ^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET2<T extends d.A>(T id) implements d.A {}
//                                                 ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ET1);
  print(ET2);
}
