// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion ConcurrentModificationError([Object modifiedObject ])
/// @description Checks that this constructor can be called and returns instance
/// of ConcurrentModificationError
/// @author sgrekhov@unipro.ru

import "../../../Utils/expect.dart";

main() {
  var error = new ConcurrentModificationError();
  Expect.isTrue(error is ConcurrentModificationError);
  Expect.runtimeIsType<ConcurrentModificationError>(error);
}
