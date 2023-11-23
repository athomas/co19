// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The static type of c is the least upper bound
/// of the static type of e2 and the static type of e3.
/// @description Checks that the static type of a conditional expression is
/// an upper bound of the static type of e2 and the static type of e3.
/// @author msyabro


import '../../../Utils/dynamic_check.dart';

main() {
  num i = (true ? 1 : 0.5); // int <=> num

  double d = (true ? 1.0 : 0); // double <=> num

  Object b = (false ? true : []); // bool <=> Object

  Object l = (false ? true : []); // List <=> Object
}
