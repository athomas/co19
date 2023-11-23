// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion factory DateTime(int year, [int month = 1, int day = 1, int hour = 0,
/// int minute = 0, int second = 0, int millisecond = 0])
/// Constructs a DateTime instance based on the individual parts.
/// The date is in the local time zone. month and day are one-based. 
/// @description Checks that the local timezone is used.
/// @author iefremov

import "../../../Utils/expect.dart";

main() {
  DateTime dt = new DateTime(2001, 1, 2, 3, 4, 5, 6);
  Expect.identical(dt, dt.toLocal());
}
