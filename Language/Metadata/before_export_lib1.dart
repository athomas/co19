// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.


library before_export_lib1;

@A() export 'before_export_lib2.dart';

class A {
  const A();
}
