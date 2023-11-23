// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool isEmpty
/// @description Checks that [isEmpty] returns [true] if [Iterator] is empty or
/// [false] otherwise.
/// @author iarkh@unipro.ru

import "../../../Utils/expect.dart";
import "dart:collection";

class NaturalIterator implements Iterator<int> {
  int limit;
  int _current = 0;

  NaturalIterator(this.limit);

  bool moveNext() {
    if (_current < limit) {
      _current++;
      return true;
    } else {
      return false;
    }
  }

  int get current => _current;
}

class MyIterable extends Object with IterableMixin {
  int _limit;

  MyIterable(this._limit);

  Iterator<int> get iterator {
    return new NaturalIterator(_limit);
  }
}

main() {
  Expect.isTrue(new MyIterable(0).isEmpty);
  Expect.isFalse(new MyIterable(10).isEmpty);
}
