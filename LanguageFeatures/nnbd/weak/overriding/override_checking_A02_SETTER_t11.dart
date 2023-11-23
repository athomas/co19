// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In a migrated library, override checking must check that an
/// override is consistent with all overridden methods from other migrated
/// libraries in the super-interface chain, since a legacy library is permitted
/// to override otherwise incompatible signatures for a method.
///
/// @description Check that if opted-in class implements two classes (one is
/// legacy) with some setter, opted-in setter of nullable type can override
/// legacy setter.
///
/// @author iarkh@unipro.ru

// Requirements=nnbd-weak
import "dart:async";
import "../../../../Utils/expect.dart";
import "override_checking_A02_opted_out_lib.dart";

void testme() {}

abstract class AA {
  void set setInt(int? i);
  void set setObject(Object? o);
  void set setDynamic(dynamic? d);
  void set setNull(Null? n);
  void set setFunction(Function? f);
  void set setFutureOr(FutureOr? f);
  void set setFutureOrInt(FutureOr<int>? f);
  void set setFutureOrFunction(FutureOr<Function>? f);
}

class A implements AA, LEGACY_SETTER {
  void set setInt(int? i)                             { Expect.isNull(i); }
  void set setObject(Object? o)                       { Expect.isNull(o); }
  void set setDynamic(dynamic d)                      { Expect.isNull(d); }
  void set setNull(Null n)                            { Expect.isNull(n); }
  void set setFunction(Function? f)                   { Expect.isNull(f); }
  void set setFutureOr(FutureOr f)                    { Expect.isNull(f); }
  void set setFutureOrInt(FutureOr<int>? f)           { Expect.isNull(f); }
  void set setFutureOrFunction(FutureOr<Function>? f) { Expect.isNull(f); }
}

 main() {
  A a = A();

  a.setInt = null;
  a.setObject = null;
  a.setDynamic = null;
  a.setNull = null;
  a.setFunction = null;
  a.setFutureOr = null;
  a.setFutureOrInt = null;
  a.setFutureOrFunction = null;
}
