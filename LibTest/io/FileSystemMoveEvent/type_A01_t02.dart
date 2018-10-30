/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int type
 *  final
 * The type of event. See FileSystemEvent for a list of events.
 * @description Checks that this property returns type of event. Test Directory
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  Directory dir = getTempDirectorySync();
  asyncStart();
  StreamSubscription s = null;
  s = dir.watch().listen((FileSystemEvent event) {
    if (event is FileSystemMoveEvent) {
      try {
        Expect.equals(FileSystemEvent.move, event.type);
        asyncEnd();
      } finally {
        dir.delete(recursive: true);
        s.cancel();
      }
    }
  });
  Directory d = getTempDirectorySync(parent: dir);
  d.renameSync(getTempDirectoryPath(parent: dir));
}
