// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A type alias declares a name for a type expression.
/// <typeAlias> ::=<metadata> typedef <typeIdentifier> <typeParameters>?‘=’<type>
/// ‘;’
/// | <metadata> typedef <functionTypeAlias>
///  <functionTypeAlias> ::= <functionPrefix> <formalParameterPart> ‘;’
///  <functionPrefix> ::= <type>? <identifier>
/// @description Checks that type alias syntax works as expected. Test
/// built-in types
/// @author sgrekhov@unipro.ru

import "../../../Utils/expect.dart";

const int meta = 1;

void getVoid() {}
dynamic getDynamic() => "123";

@meta typedef Aint = int;
@meta typedef Anum = num;
@meta typedef Adouble = double;
@meta typedef AString = String;
@meta typedef AObject = Object;
@meta typedef Avoid = void;
@meta typedef ANull = Null;
@meta typedef Adynamic = dynamic;
@meta typedef AFunction = Function;

main() {
  Aint ai = 1;
  Expect.isTrue(ai is int);
  Expect.isTrue(1 is Aint);
  Expect.runtimeIsType<int>(ai);
  Expect.runtimeIsType<Aint>(1);

  Anum an = 3;
  an = 3.14;
  Expect.isTrue(an is num);
  Expect.runtimeIsType<num>(an);

  Adouble ad = 3.1415926;
  Expect.isTrue(ad is double);
  Expect.runtimeIsType<double>(ad);

  AString as = "Lily was here";
  Expect.isTrue(as is String);
  Expect.runtimeIsType<String>(as);

  AObject ao = new AObject();
  ao = new Object();

  Avoid av = getVoid();

  ANull anull = null;
  Expect.isTrue(anull is Null);
  Expect.runtimeIsType<Null>(anull);

  Adynamic adyn = getDynamic();
  Expect.isTrue(adyn is dynamic);
  Expect.runtimeIsType<dynamic>(adyn);

  AFunction af = getVoid;
  Expect.isTrue(af is Function);
  Expect.runtimeIsType<Function>(af);
}
