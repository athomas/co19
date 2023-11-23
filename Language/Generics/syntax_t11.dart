// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A class declaration, type alias, or function [G] may be generic,
/// that is, [G] may have formal type parameters declared.
/// @description Checks that a compile-time error is produced when "extends"
/// is not followed with "type" for the generic class.
/// @author kaigorodov


class C<T extends >{}
//                ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
