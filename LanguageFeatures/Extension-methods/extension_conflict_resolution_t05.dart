// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If more than one extension applies to a specific member
/// invocation, then we resort to a heuristic to choose one of the extensions to
/// apply. If exactly one of them is "more specific" than all the others, that
/// one is chosen. Otherwise it is a compile-time error.
///
/// An extension with [on] type clause [T1] is more specific than another
/// extension with [on] type clause [T2] iff
///
///   1. The latter extension is declared in a platform library, and the former
///      extension is not
///   2. they are both declared in platform libraries or both declared in
///      non-platform libraries, and
///   3. the instantiated type (the type after applying type inference from the
///      receiver) of [T1] is a subtype of the instantiated type of [T2] and
///      either
///   4. not vice versa, or
///   5. the instantiate-to-bounds type of [T1] is a subtype of the
///      instantiate-to-bounds type of [T2] and not vice versa.
/// @description Check that there cannot be extension method invocation for the
/// receiver of type [dynamic], no matter which extensions are in scope.
/// @author iarkh@unipro.ru



import "../../Utils/expect.dart";
import "extension_conflict_resolution_lib.dart";

extension MyStringFancyList<T extends String> on List<T> {
  bool get isIntLibraryVersion => false;
}

dynamic aList = <int>[1, 2, 3];

main() {
  Expect.throws(() { aList.isIntLibraryVersion; });
}

