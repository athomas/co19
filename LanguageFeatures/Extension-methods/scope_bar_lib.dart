// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @author sgrekhov@unipro.ru


library scope_bar_lib;

extension Bar<T> on List<T> {
  String bar() => "bar-bar";
  static String staticBar = "staticBar-Bar";
}
