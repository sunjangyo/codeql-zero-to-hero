/**
 * @id codeql-zero-to-hero/3-3
 * @severity error
 * @kind problem
 */

import python
import semmle.python.ApiGraphs

from API::Node source
where
    source =
        API::moduleImport("flask")
            .getMember("request")
            .getMember("args")

select
    source.asSource(),
    source.getLocation().getFile().getRelativePath(),
    source.getLocation().getStartLine(),
    source.getLocation().getStartColumn(),
    "Flask request.args source"
