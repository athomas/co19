// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The static type of a function literal of the form
/// (T1 a1,...,Tn an, {Tn+1 xn+1: d1,...,Tn+k xn+k: dk}) sync* {s} is
/// (T1,...,Tn, {Tn+1 xn+1,...,Tn+k xn+k}) -> Iterable.
/// In any case where Ti, 1 <= i <= n + k, is not specified, it is considered
/// to have been specified as dynamic.
/// @description Checks that the function literal of the form
/// (T1 a1,...,Tn an, {Tn+1 xn+1: d1,...,Tn+k xn+k: dk]) sync* {s} may be
/// assigned to function type variables with Iterable return type and
/// corresponding parameter types.
/// @author ngl@unipro.ru


typedef Iterable iterFunc();
typedef Iterable iterFuncParam(List p1, {List? p2});

main() {
  iterFunc if1 = () sync* {};
  iterFuncParam ifp1 = (List p1, {List? p2}) sync* {};
}
