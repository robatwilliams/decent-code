# Formatting

*Almost all formatting issues should be automated through tools such as ESLint or Checkstyle. Violations should fail the build.*

*Local development (file-watch) builds need not fail on violations, lest it become an annoying inconvenience. Editor/IDE settings matching the requirements should be checked in and shared, for example using [EditorConfig](https://editorconfig.org/) files. Also consider running the automated checks using a source control pre-commit hook.*

*The following includes only the key things to get right; it's not a comprehensive set of settings for automated tools.*

----

**Use consistent line endings.** Source control tools consider otherwise identical lines with different ending breaks to be different. Mixing within a project will cause unnecessary diff noise (making code harder to review) and merge problems, especially when code is moved during refactoring.

**Use consistent indentation.** Another cause of "false differences". Mixing styles will cause the aforementioned problems.

**Avoid leaving trailing whitespace.** They're a source of "false differences", and there's no good reason to have them.

**End files with a linebreak.** This avoids the existing final line being considered as modified in a diff when you add a new line after it later.

**Use single blank lines judiciously to separate constructs and groups of statements.** Blank lines create visual separation between logical parts, making code easier to read. Dense code is harder to read. Examples include after a group of variable declarations, around an if-else statement, around logical parts of a method, and before a return statement.

**Avoid any unnecessary or unrelated changes to formatting, indentation etc.** They detract from the purpose of the work at hand, cause diff noise (and the aforementioned associated issues), and make the line-by-line change history less useful. This problem usually arises in codebases where these guidelines aren't adhered to (or enforced), especially when editor/IDE auto-format features are turned on.

**If in doubt, look at the existing code.** Existing code in the project will illustrate established conventions.

**Avoid personal trademarks.** It shouldn't be possible by reading the code to tell who wrote it. As far as formatting is concerned, this shouldn't be an issue if automated tools are set up with adequate rules.
