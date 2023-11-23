// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion final Map<String, String> queryParameters
/// Returns the URI query split into a map according to the rules specified
/// for FORM post in the HTML 4.01 specification section 17.13.4. Each key
/// and value in the returned map has been decoded. If there is no query the
/// empty map is returned. The returned map is unmodifiable and will throw
/// UnsupportedError on any calls that would mutate it.
/// @description Checks that keys and values are decoded properly
/// @author sgrekhov@unipro.ru

import "../../../Utils/expect.dart";

main() {
  var q = 'a=b&c=%D1%84&d+=+d+&x=%26';
  var map = {'a': 'b', 'c': 'ф', 'd ': ' d ', 'x': '\u0026'};
  Expect.mapEquals(map, new Uri.http('host', 'path', map).queryParameters);
  Expect.mapEquals(map, new Uri(query: q).queryParameters);
  Expect.mapEquals(map, Uri.parse('http://host/path?$q').queryParameters);
}
