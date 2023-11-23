// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// Future<Process> start(
///     String executable,
///     List<String> arguments, {
///     String workingDirectory,
///     Map<String, String> environment,
///     bool includeParentEnvironment: true,
///     bool runInShell: false,
///     ProcessStartMode mode: ProcessStartMode.normal
/// })
///
/// If mode is ProcessStartMode.DETACHED_WITH_STDIO a detached process will be
/// created where the stdin, stdout and stderr are connected. The creator can
/// communicate with the child through these. The detached process will keep
/// running even if these communication channels are closed. The process' exit
/// code will not become available when it terminated.
///
/// @description Checks that if mode is ProcessStartMode.DETACHED_WITH_STDIO a
/// detached process will be created where the stdin, stdout and stderr are
/// connected. The process' exit code will not become available when it
/// terminated.
/// @author ngl@unipro.ru
/// @issue 30945

import "dart:convert";
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

String command = "";
List<String> args = new List<String>.empty(growable: true);

void setCommand() {
  if (Platform.isWindows) {
    command = 'dart';
    args = ['--version'];
  } else {
    command = 'pwd';
    args = [];
  }
}

Future testEmpty(var stream) {
  return stream.toList().then((List errList) {
    Expect.equals(0, errList.length);
  });

}

Future testNotEmpty(var stream) {
  return stream.transform(utf8.decoder).transform(const LineSplitter()).
      toList().then((List outList) {
    Expect.isTrue(outList[0].length > 0);
  });
}

main() {
  setCommand();
  asyncStart();
  Process
      .start(command, args, mode: ProcessStartMode.detachedWithStdio)
      .then((Process process) {
    if (Platform.isWindows) {
      testEmpty(process.stderr).then((_) {
        testNotEmpty(process.stdout).then((_) {
          asyncEnd();
        });
      });

    } else {
      testEmpty(process.stderr).then((_) {
        testNotEmpty(process.stdout).then((_) {
          asyncEnd();
        });
      });
    }
  });
}
