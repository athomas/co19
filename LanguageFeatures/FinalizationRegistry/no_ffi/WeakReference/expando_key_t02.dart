// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Not all objects are supported as targets for weak references. The
/// WeakReference constructor will reject any object that is not supported as an
/// Expando key.
///
/// @description Check that WeakReference constructor rejects any object that is
/// not supported as an Expando key. Test numbers.
/// @author sgrekhov@unipro.ru
/// @issue 48264

import '../../../../Utils/expect.dart';

main() {
  Expect.throws(() {
    WeakReference wr = WeakReference<int>(42);
  });
  Expect.throws(() {
    WeakReference wr = WeakReference(42);
  });
  Expect.throws(() {
    WeakReference wr = WeakReference<double>(3.14);
  });
  Expect.throws(() {
    WeakReference wr = WeakReference(3.14);
  });
  Expect.throws(() {
    WeakReference wr = WeakReference<num>(42);
  });
  Expect.throws(() {
    WeakReference wr = WeakReference<num>(3.14);
  });
}
