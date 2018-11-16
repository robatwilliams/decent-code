# Comments

**Avoid pointless comments which don't add any value.** If something is clear from reading the code, a comment only adds noise.

**Consider whether the code could be improved such that the comment would no longer be necessary.** Comments which explain what the code is doing, and sometimes why, can often be rendered unnecessary through improving naming, refactoring, or introducing explanatory variables.

**Consider whether a unit test would be better communication.** Well-constructed and named unit tests can explain the reasoning behind the code, as well as demonstrating and verifying its behaviour in different cases.

**Explain reasoning when it's not clear from the code.** Anticipate what may leave future maintainers puzzled about the code. Examples include edge case handling, constraints that have to be worked around, and performance optimisations.

**Draw attention to the surprising and "gotchas".** If something is unintuitive or caught you out, it may be worth noting to help others. Examples include seemingly illogical business "logic", and surprising library code behaviour.

**Explain the choice of particular "magic values".** These include framework/server settings, timeouts, limits, batch/pool sizes, priorities, cache configuration, and orderings. We're familiar with extracting such values from our code into constants or configuration, but the reasons behind choosing the actual value is often left out. In some cases, this is after spending significant effort on activities such as load testing in order to choose appropriate values. Documenting these allows future changes to be made with greater confidence.

**Highlight bug workarounds, linking to an issue report.** This allows them to be easily identified and removed at a later date when the underlying bug (e.g. in a library) has been fixed. See [bug fixes](bug-fixes.md).

**Document relationships between distant and disconnected parts of the code.** It's quite rare that these can't be made explicit through code. They are often things that are a certain way because something else far away (could even be in a downstream system) is a certain way - such as dependencies, or matching behaviours. Changing one could break the other in a surprising way, or introduce inconsistency in the user experience.

Write **clearly, concisely, and unambiguously.** Comments which follow these principles are quicker and easier to understand, and help avoid misinterpretation or confusion. The process of writing can often trigger ideas or solutions to problems, in much the same way as merely explaining a problem to someone can help you come up with a solution. Refactoring isn't only for code; after writing a comment, read it and consider if it could be improved.

Ensure that comments are **in sync and correct with respect to the current version of the code.** Outdated or no longer applicable comments can cause confusion.

Follow the project's **strategy for managing TODO comments.** Buildup of such comments in the code often indicates buildup of technical debt and necessary work. These tasks remain invisible to project feature/bug work tracking, leaving them in danger of being overlooked and forgotten - with various consequences. One such strategy is to require all TODOs to reference an issue tracker ticket before a pull request can be merged.
