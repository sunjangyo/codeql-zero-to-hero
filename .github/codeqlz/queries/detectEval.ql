
/**
 * @name Use of eval()
 * @description Detects calls to the Python eval() function.
 * @kind problem
 * @security-severity 6.0
 * @problem.severity warning
 * @precision medium
 * @id custom/python-eval-call
 * @tags security
 *       external/cwe/cwe-095
 */

import python

from Call call
where
  call.getFunc() instanceof Name and
  call.getFunc().(Name).getId() = "eval"
select call, "Potentially unsafe use of eval()."
