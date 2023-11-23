// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A multi-line comment begins with the token '/*' and ends with the
/// token '*/'. Everything between '/*' and '*/' must be ignored by the Dart
/// compiler unless the comment is a documentation comment. Comments may nest.
/// MULTI LINE COMMENT  :
///   '/''*' (MULTI LINE COMMENT | ~ '*''/')* '*''/'
/// ;
/// @description Checks that the nesting of multi-line comments is allowed and
/// there doesn't need to be whitespace between adjacent start/end tokens.
/// @author vasya

import "../../../../Utils/expect.dart";

/*
  Main comment
  /*
    Sub comment
  */
  End of main comments
  /*/*/* Deeply nested comment **/**/**/
  /**//**/
*/

main() {
  Expect.equals(true, true);
}
