// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is no static warning if a function contains both one or more
/// return statements of the form return; and one or more return statements of
/// the form return e;.
///
/// @description Checks that it is not a warning if a function literal has
/// explicit and implicit return statements of different kind.
///
/// @note implicit returns do not count, see 14764
/// https://github.com/dart-lang/sdk/issues/39476
/// @author ilya
/// @issue 42581


main() {
  (x) {
    if (x)
      return 1;
    // implicit return;
  } (true);
}
