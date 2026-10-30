#!/bin/bash
# pemakaian: ./sarif2qf.sh aircrack-results.sarif > qf.txt
jq -r '
  .runs[] as $run
  | $run.results[]
  | . as $r
  | ($r.locations[0].physicalLocation) as $loc
  | "\($loc.artifactLocation.uri):\($loc.region.startLine // 1):\($loc.region.startColumn // 1): [\($r.ruleId)] (\($r.level // "warning")) \($r.message.text | gsub("\n";" "))"
' "$1"
