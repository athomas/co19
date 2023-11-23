// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion ByteData asByteData([int offsetInBytes = 0, int length ])
/// Creates a ByteData view of a region of this byte buffer.
/// ...
/// The viewed region start at offsetInBytes and contains length bytes. If length
/// is omitted, the range extends to the end of the buffer.
/// @description Checks that the created viewed region begins with offsetInBytes
/// byte and contains length bytes. When length is omitted, the range extends to
/// the end of the buffer.
/// @author ngl@unipro.ru

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(ByteBuffer buffer) {
  ByteData res = buffer.asByteData(0);
  int viewSizeInBytes = res.lengthInBytes;
  int offset1 = 1;
  int length1 = viewSizeInBytes - offset1 - 1;
  int offset2 = 3;
  var res1 = buffer.asByteData(offset1, length1);
  var res2 = buffer.asByteData(offset2);
  int view1SizeInBytes = res1.lengthInBytes;
  int view2SizeInBytes = res2.lengthInBytes;

  Expect.isTrue(res is ByteData);
  Expect.isTrue(res1 is ByteData);
  Expect.runtimeIsType<ByteData>(res);
  Expect.runtimeIsType<ByteData>(res1);
  Expect.equals(length1, view1SizeInBytes);
  Expect.equals(viewSizeInBytes - offset2, view2SizeInBytes);

  if (viewSizeInBytes != 0) {
    // set value to the first byte of res1
    res1.setInt8(0, 2);
    // offset1 byte of res is equal to the set value
    Expect.equals(2, res.getInt8(offset1));
    // set value to the last byte of res1
    res1.setInt8(view1SizeInBytes - 1, 4);
    // (offset1 + view1_size_in_bytes - 1) byte of res is equal to the set value
    Expect.equals(4, res.getInt8(offset1 + view1SizeInBytes - 1));

    // set value to the first byte of res2
    res2.setInt8(0, 3);
    // offset2 byte of res is equal to the set value
    Expect.equals(3, res.getInt8(offset2));
    // set value to the last byte of res2
    res2.setInt8(view2SizeInBytes - 1, 5);
    // the last byte of res is equal to the set value
    Expect.equals(5, res.getInt8(viewSizeInBytes - 1));
  }
}

main() {
  var list2 = new List.filled(6, 0);
  var list4 = new Int32x4List(6);

  check((new Int8List.fromList(list2)).buffer);
  check((new Int16List.fromList(list2)).buffer);
  check((new Int32List.fromList(list2)).buffer);
  if (!isJS) {
    check((new Int64List.fromList(list2)).buffer);
  }
  check((new Int32x4List.fromList(list4)).buffer);
}
