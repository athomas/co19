// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Regression test for the issue 34482 (Unexpected type exception
/// during the assigning [Future] variable to [FutureOr]) Checks that [FutureOr]
/// object can be assigned to [Future] variable
/// @Issue 34482
/// @author iarkh@unipro.ru

import "dart:async";

main() {
  Future f = new Future(() => 12345);
  Future? f1 = f;
  Future<dynamic>?  f2 = f;
  Future<Object?>?  f3 = f;
  Future<void>?     f4 = f;
  Future<FutureOr>? f5 = f;

  FutureOr? f6 = f;
  FutureOr<dynamic>?  f7 = f;
  FutureOr<Object>?   f8 = f;
  FutureOr<Object?>?  f9 = f;
  FutureOr<void>?     f10 = f;
  FutureOr<FutureOr>? f11 = f;
}
