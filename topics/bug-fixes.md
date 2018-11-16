# Bug fixes

**Find the cause before attempting a fix.** Any fix based on first-glance analysis without knowing or understanding the cause is unlikely to be a good/correct one.

**Are there other occurrences of this bug or similar ones that need fixing?** They could be in similar functionality, or in code using similar techniques/patterns that could be prone to similar programming errors.

**Fix the root cause.** Fixing symptoms alone, or intermediate causes, is a workaround rather than a complete fix. They often involve adding code to work against something other code is doing.

**Understand why the fix works.** A fix which appears to work, but cannot be explained why, may be unreliable or incomplete.

**Add test(s) which don't pass without the fix.** Tests will help prevent regression - the bug being reintroduced through later changes. Choose unit and/or integration tests as appropriate. Validate the test by checking that it fails against the unfixed code.

**Describe the issue and underlying problem briefly in the commit message.** Doing so aids reviewers in understanding the fix, and contributes to useful history. Linked bug report tickets are unlikely to have adequate technical detail or analysis.

**Report bugs in open source libraries.** Getting them fixed at the source will allow us to later remove any workarounds we had to implement, and improves their quality for everyone. If one exists already, "+1" it and add any useful information for maintainers or other consumers (e.g. workarounds). Comment any workarounds in our code, including a link to the bug report. Subscribe to it, to be notified when it gets fixed.

**What can we do to avoid or automatically detect similar bugs in future?** There may be patterns we should use (or avoid), or knowledge we should share. There may be linter [rules](https://eslint.org/docs/rules/#possible-errors), [plugins](https://github.com/amilajack/eslint-plugin-compat), or [other](https://github.com/anandthakker/doiuse) tools we could use to automatically detect would-be issues at the earliest opportunity.
