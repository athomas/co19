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
/// ...
/// Use environment to set the environment variables for the process. If not set
/// the environment of the parent process is inherited. Currently, only US-ASCII
/// environment variables are supported and errors are likely to occur if an
/// environment variable with code-points outside the US-ASCII range is passed
/// in.
///
/// @description Checks that if environment is not set the environment of the
/// parent process is inherited.
/// @author ngl@unipro.ru

import "dart:convert";
import "dart:io";
import "../../../Utils/expect.dart";

runMain() {
  String envString = Platform.environment.toString();
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();

  asyncStart();
  Process.start(executable, [...Platform.executableArguments, eScript, "run"])
      .then((Process process) {
    process.stdout.transform(utf8.decoder).transform(const LineSplitter()).
        toList().then((List outList) {
      Expect.isTrue(outList[0].contains(envString));
    }).then((_) {
      process.stderr.toList().then((List errList) {
        Expect.equals(0, errList.length);
        asyncEnd();
      });
    });
  });
}

runProcess() {
  stdout.write(Platform.environment);
}

main(List<String> args) {
  if (args.length > 0)
    runProcess();
  else {
    runMain();
  }
}
