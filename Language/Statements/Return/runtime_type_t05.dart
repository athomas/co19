// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let S be the runtime type of o.
///    • If the body of f is marked async it is a compile type error if o is not
/// null and Future<S> is not a subtype of the actual return type of f.
///    • Otherwise, it is a compile type error if o is not null and the runtime
/// type of o is not a subtype of the actual return type of f.
///
/// @description Checks that dynamic type error does not occur in immediately
/// enclosing async function if o is null.
///
/// @author a.semenov@unipro.ru

import 'dart:async';
import '../../../Utils/expect.dart';

var r = null;

Future<int?> foo() async { return r as int?; }

main() {
  asyncStart();
  foo().then(
      (_) {
        asyncEnd();
      },
      onError: (e) {
        Expect.fail("Caught unexpected exception $e");
      }
  );
}
