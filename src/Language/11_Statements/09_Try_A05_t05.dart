/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A try statement try s1 catch1...catchn finally sf defines an exception
 * handler h that executes as follows:
 * The catch clauses are examined in order, starting with catch1, until either
 * a catch clause that matches the current exception (11.14) is found, or the list
 * of catch clauses has been exhausted. If a catch clause catchk is found, then
 * pk1 is bound to the current exception, pk2 is bound to the current stack trace
 * (11.14), and then catchk is executed. If no catch clause is found, the finally
 * clause is executed. Then, execution resumes at the end of the try statement.
 * A finally clause "finally s" defines an exception handler h that executes by
 * executing the finally clause. Then, execution resumes at the end of the try
 * statement.
 * Execution of a catch clause "catch (p1, p2) s" of a try statement t proceeds as follows: 
 * The statement s is executed in the dynamic scope of the exception
 * handler defined by the finally clause of t. Then, the current exception and
 * current stack trace both become undefined.
 * Execution of a finally clause "finally s" of a try statement proceeds as follows:
 * The statement s is executed. Then, if the current exception is defined,
 * control is transferred to the nearest dynamically enclosing exception handler.
 * Execution of a try statement of the form "try s1 catch1...catchn finally sf;"
 * proceeds as follows:
 * The statement s1 is executed in the dynamic scope of the exception handler
 * defined by the try statement. Then, the finally clause is executed.
 * @description Explicitly checks that if no matching catch clause was found for the current
 * exception, control is transferred to the nearest dynamically enclosing exception handler.
 * @author rodionov
 * @reviewer iefremov
 */


void main() {
  bool flag1 = false, flag2 = false;
  
  try {
    try {
      do {
        try {
          for(int i = 0; i < 10; i++) {
            try {
              throw new Exception("fail");
            } catch (int e) {
            } finally {}
          }
        } catch (String s) {}
      } while(false);
    } finally {
      flag1 = true;
    }
  } catch (var ok) {
    flag2 = true;
  }

  Expect.isTrue(flag1);
  Expect.isTrue(flag2);
}
