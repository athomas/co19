// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If a declaration d named n is in the namespace induced by a 
/// scope S, then d hides any declaration named n that is available in the 
/// lexically enclosing scope of S.
/// @description Checks that no warning is produced if a local variable 
/// introduces a name that is identical to a function type alias available in 
/// the current scope.
/// @author iefremov


typedef foo();

main() {
  var foo;
}
