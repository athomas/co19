// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion String targetSync()
/// Synchronously gets the target of the link. Returns the path to the target.
///
/// If the returned target is a relative path, it is relative to the directory
/// containing the link.
///
/// If the link does not exist, or is not a link, throws a FileSystemException.
/// @description Check that this method returns the target of the link. Tests
/// directory as a target and a relative path
///
/// @note The test should run with the Administrator priveleges on Windows.
/// Dart API Spec reads:
/// In order to create a symbolic link on Windows, Dart must be run in
/// Administrator mode or the system must have Developer Mode enabled, otherwise
/// a FileSystemException will be raised with ERROR_PRIVILEGE_NOT_HELD set as
/// the errno when this call is made.
///
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  Directory parent = getTempDirectorySync(parent: sandbox);
  Directory target = getTempDirectorySync(parent: parent);
  Link link = new Link(
      target.path + Platform.pathSeparator + getTempFileName(extension: "lnk"));
  link.createSync("..");
  Expect.equals("..", link.targetSync());
}
