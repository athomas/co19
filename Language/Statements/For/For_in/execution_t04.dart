// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A for statement of the form for (finalConstVarOrType? id in e) s
/// is equivalent to the following code:
///   var n0 = e.iterator;
///   while (n0.moveNext()) {
///     finalConstVarOrType? id = n0.current;
///     s
///   }
/// where n0 is an identifier that does not occur anywhere in the program, except
/// that for purposes of static typechecking, it is checked under the assumption
/// that n0 is declared to be of type T, where T is the static type of e.iterator.
/// @description Checks that a runtime error is thrown when e is null.
/// @author vasya

import '../../../../Utils/expect.dart';

dynamic getNull() => null;

main() {
  Expect.throws(() { for(var id in getNull()) {} });
  Expect.throws(() { for(dynamic id in getNull()) {} });
  Expect.throws(() {
      var id;
      for(id in getNull()) {}
    });
}
