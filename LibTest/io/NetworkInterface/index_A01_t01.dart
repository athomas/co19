// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion int index
/// Get the index of the NetworkInterface.
///
/// @description Checks that [index] gets the int value that is the index of
/// the NetworkInterface.
/// @author ngl@unipro.ru

import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Future<List<NetworkInterface>> fList =
      NetworkInterface.list(includeLoopback: true, includeLinkLocal: true);

  asyncStart();
  fList.then((fValue) {
    for (int i = 0; i < fValue.length; i++) {
      NetworkInterface nwInterface = fValue[i];
      Expect.isTrue(nwInterface.index is int);
      Expect.runtimeIsType<int>(nwInterface.index);
    }
    asyncEnd();
  });
}
