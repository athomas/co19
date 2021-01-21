/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let d be the declaration of a variable v.  If d is a local or
 * instance variable, then the invocation of the implicit getter of v
 * evaluates to the value stored in v.
 * If d is a static or library variable then the implicit getter method of v
 * executes as follows:
 * - Non-constant variable declaration with initializer. If d is of one of the 
 *   forms var v = e; , T v = e; , final v = e; , final T v = e; , static 
 *   v = e; , static T v = e; , static final v = e;  or static final T v = e; 
 *   and no value has yet been stored into v then the initializer expression 
 *   e is evaluated. If, during the evaluation of e, the getter  for v is 
 *   invoked, a CyclicInitializationError is thrown. If the evaluation 
 *   succeeded yielding an object o, let r = o, otherwise let r = null. In 
 *   any case, r is stored into v. The result of executing the getter is r.
 * - Constant variable declaration. If d is of one of the forms const v = e; ,
 *   const T v = e; , static const v = e;  or static const T v = e; the result
 *   of the getter is the value of the compile time constant e. Note that a
 *   compile time constant cannot depend on itself, so no cyclic references 
 *   can occur. Otherwise
 * - Variable declaration without initializer. The result of executing the
 *   getter method is the value stored in v.
 * @note NNBD Spec now reads: If a variable or field is read from during the
 * process of evaluating its own initializer expression, and no write to the
 * variable has occurred, the read is treated as a first read and the
 * nitializer expression is evaluated again.
 *
 * A toplevel or static variable with an initializer is evaluated as if it was
 * marked [late]. Note that this is a change from pre-NNBD semantics in that:
 *
 * Throwing an exception during initializer evaluation no longer sets the
 * variable to [null]
 *
 * Reading the variable during initializer evaluation is no longer checked for,
 * and does not cause an error.
 *
 * @description Checks that if during the evaluation of [e], the getter for [v]
 * is invoked, a [CyclicInitializationError] is not thrown. Confirms that [func]
 * gets recursively called by incrementing a counter and stopping the infinite
 * recursion after 20 cycles. This avoids relying on particulars of the behavior
 * on stack overflow and makes the test cheaper to run.
 * @author msyabro
 * @Issue 42470
 * @issue 42642
 */
import "../../../Utils/expect.dart";

int count = 0;

f(func) {
  try {
    throw 1; // caugth exceptions do not matter
  } on int catch (e) {
    count++;
    if (count < 20) func();
  }
  count = 0;
}

class C {
  static var sVar = f(() => sVar);
  static int? sTyped = f(() => sTyped);
  static final sFinal = f(() => sFinal);
  static final int? sFinalTyped = f(() => sFinalTyped);
}


main() {
  () => C.sVar;
  Expect.equals(null, C.sVar);

  () => C.sTyped;
  Expect.equals(null, C.sTyped);

  () => C.sFinal;
  Expect.throws(() { C.sFinal; };

  () => C.sFinalTyped;
  Expect.throws(() { C.sFinalTyped; });
}
