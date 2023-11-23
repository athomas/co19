// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion final int last
/// If [this] is empty throws a [StateError].
/// @description Checks that a [StateError] is thrown if [this] is empty.
/// @author msyabro

import "../../../Utils/expect.dart";

main() {
  var runes = new Runes('');
  Expect.throws(() {runes.last;}, (e) => e is StateError);
}
