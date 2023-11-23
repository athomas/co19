// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion target property
/// T? target
/// The current object weakly referenced by this, if any.
///
/// The value is either the object supplied in the constructor, or null if the
/// weak reference has been cleared.
///
/// @description Check that the value of this property value is either the
/// object supplied in the constructor, or null if the weak reference has been
/// cleared
/// @author sgrekhov@unipro.ru
/// @issue 48391

import "../../gc_utils_lib.dart";
import "../../../../Utils/expect.dart";

class C {
  int id;
  C(this.id);

  String toString() => "C($id)";
}

@pragma('vm:never-inline')
List<WeakReference<C>> createWeakReference() {
  C c = C(42);
  WeakReference<C> wr1 = WeakReference(c);
  WeakReference<C> wr2 = WeakReference(c);
  Expect.equals(c, wr1.target);
  Expect.equals(c, wr2.target);
  triggerGc();
  Expect.equals(c, wr1.target);
  Expect.equals(c, wr2.target);
  return [wr1, wr2];
}

@pragma('vm:never-inline')
void checkReferences(List<WeakReference<C>> refs) {
  C? c1 = refs[0].target;
  C? c2 = refs[1].target;
  Expect.isTrue(c1 == null || c1.toString() == "C(42)");
  Expect.isTrue(c2 == null || c2.toString() == "C(42)");
}

main() {
  List<WeakReference<C>> refs = createWeakReference();
  checkReferences(refs);
  triggerGc();
  Expect.isNull(refs[0].target);
  Expect.isNull(refs[1].target);
}
