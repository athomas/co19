// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion constantPattern ::= booleanLiteral
///                   | nullLiteral
///                   | '-'? numericLiteral
///                   | stringLiteral
///                   | symbolLiteral
///                   | identifier
///                   | qualifiedName
///                   | constObjectExpression
///                   | 'const' typeArguments? '[' elements? ']'
///                   | 'const' typeArguments? '{' elements? '}'
///                   | 'const' '(' expression ')'
///
/// A constant pattern determines if the matched value is equal to the
/// constant's value. We don't allow all expressions here because many
/// expression forms syntactically overlap other kinds of patterns. We avoid
/// ambiguity while supporting terse forms of the most common constant
/// expressions like so:
/// ...
/// Named constants are also allowed because they aren't ambiguous. That
/// includes simple identifiers like someConstant, prefixed constants like
/// some_library.aConstant, static constants on classes like
/// SomeClass.aConstant, and prefixed static constants like
/// some_library.SomeClass.aConstant. Simple identifiers would be ambiguous with
/// variable patterns that aren't marked with var, final, or a type, but
/// unmarked variable patterns are only allowed in irrefutable contexts where
/// constant patterns are prohibited.
///
/// @description Check static constants on classes with a library prefix in
/// constant patterns. Test switch expressions
/// @author sgrekhov22@gmail.com

import "patterns_lib.dart" as p;
import "../../Utils/expect.dart";

String testBool(bool value) {
  return switch (value) {
    p.C0.True => "true",
    p.C0.False => "false"
  };
}

String testNum(num value) {
  return switch (value) {
    p.C0.Zero => "zero",
    p.C0.Pi => "pi",
    p.C0.Answer => "answer",
    p.C0.Negative => "negative",
    p.C0.NegativePi => "negative-pi",
    p.C0.MaxJSInt => "max_int",
    _ => "default"
  };
}

String testString(String value) {
  return switch (value) {
    p.C0.Melody => "Melody",
    _ => "default"
  };
}

main() {
  Expect.equals("true", testBool(true));
  Expect.equals("false", testBool(false));

  Expect.equals("zero", testNum(0));
  Expect.equals("zero", testNum(0.0));
  Expect.equals("pi", testNum(3.14));
  Expect.equals("answer", testNum(42));
  Expect.equals("negative", testNum(-1));
  Expect.equals("negative-pi", testNum(-3.14));
  Expect.equals("max_int", testNum(9007199254740991));
  Expect.equals("default", testNum(1));

  Expect.equals("Melody", testString("Lily was here"));
  Expect.equals("default", testString(""));
}
