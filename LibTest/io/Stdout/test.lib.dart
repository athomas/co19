// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @author iarkh@unipro.ru

import "../../../Utils/expect.dart";
import "../file_utils.dart";
import "dart:async";
import "dart:convert";
import "dart:io";

Future<ProcessResult> run_Windows(String executable, String script,
    String filename, Encoding? enc) {
  var args = [...Platform.executableArguments, script, "test", ">", filename];
  return Process.run(executable, args, runInShell: true, stdoutEncoding: enc);
}

Future<ProcessResult> run_Linux(String executable, String script,
    String filename, Encoding? enc) {
  String executableArgs = Platform.executableArguments.join(" ");
  return Process.run(
      "bash", ["-c", executable + " " + executableArgs + " " + script + " test > " + filename],
      runInShell: true, stdoutEncoding: enc);
}

run_main(Encoding? enc, List<int> expected) async {
  String executable = Platform.resolvedExecutable;
  String script = Platform.script.toString();
  int called = 0;

  Directory sandbox = getTempDirectorySync();
  File f = getTempFileSync(parent: sandbox);
  String filename = f.path;

  await (Platform.isWindows
          ? run_Windows(executable, script, filename, enc)
          : run_Linux(executable, script, filename, enc))
      .then((ProcessResult results) async {
    final file = new File(filename);
    final contents = await file.readAsBytes();
    await file.delete();
    Expect.listEquals(expected, contents, results.stderr);
    called++;
  }).whenComplete(() {
    sandbox.delete(recursive: true);
  });
  Expect.equals(1, called);
}
