// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void attach(
///    Object value,
///    T finalizationToken,
///    {Object? detach}
/// )
/// Attaches this finalizer to [value].
///
/// When [value] is longer accessible to the program, while still having an
/// attachment to this finalizer, the [callback] of this finalizer may be
/// called with [finalizationToken] as argument.
///
/// @description Checks that finalizer with the given [detach] token can be
/// detached from the object.
/// @author iarkh@unipro.ru

import '../../gc_utils_lib.dart';
import '../../../../Utils/expect.dart';

class A {}

int cnt = 0;
final Finalizer finalizer = Finalizer((token) {
  cnt++;
});

@pragma('vm:never-inline')
void createAndAttach(token) {
  Object value = Object();
  finalizer.attach(value, "Finalization token", detach: token);
}

main() async {
  A detachToken = A();
  createAndAttach(detachToken);
  finalizer.detach(detachToken);
  await triggerGcWithDelay();
  Expect.equals(0, cnt);
  await triggerGcWithDelay();
  Expect.equals(0, cnt);
  await triggerGcWithDelay();
  Expect.equals(0, cnt);
}
