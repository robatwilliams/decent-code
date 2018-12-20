#!/bin/bash

sed -s '$a\\n\n\n\n\n----------------------------------------\n' \
  README.md \
  topics/naming-things.md \
  topics/code-flow.md \
  topics/code-structure.md \
  topics/general-programming.md \
  topics/functional.md \
  topics/error-handling.md \
  topics/logging.md \
  topics/tests.md \
  topics/files.md \
  topics/formatting.md \
  topics/dependencies.md \
  topics/tech-css.md \
  topics/tech-html.md \
  topics/tech-java.md \
  topics/tech-javascript.md \
  topics/comments.md \
  topics/commits.md \
  topics/pull-request.md \
  topics/features.md \
  topics/ui-text.md \
  topics/bug-fixes.md \
  > all.md

cat topics/meta.md \
  >> all.md
