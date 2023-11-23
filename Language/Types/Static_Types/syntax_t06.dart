// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Static type annotations are used in variable declarations
/// (including formal parameters), in the return types of functions and in the
/// bounds of type variables. Static type annotations are used during static
/// checking
/// type:
///   typeName typeArguments?
/// ;
/// typeName:
///   qualified
/// ;
/// typeArguments:
///   '<' typeList '>'
/// ;
/// typeList:
///   type (',' type)*
/// ;
/// @description Checks that the type argument can be parameterized as well.
/// @Issue 47496
/// @author iefremov


class G<T> {
  G() {}
}

main() {
  G<G<G<G<G<G<G<G<G<G<G<G<G<G<G<G<G<G<G<G<G<G<G<G<G<G<G<G<G<G<G<G>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> t =
    new G<G<G<G<G<G<G<G<G<G<G<G<G<G<G<G<G<G<G<G<G<G<G<G<G<G<G<G<G<G<G<G>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>();
}
