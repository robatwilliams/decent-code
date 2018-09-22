# Naming things

> There are only two hard things in Computer Science: cache invalidation and naming things
>
> &mdash; <cite>Phil Karlton<cite>

**One name for each thing, and each name used for only one thing.** Using multiple words to mean the same thing, or the same word to mean different things, wastes cognitive effort and is likely to cause confusion. This not only applies to code, but to everything in the context of our work, for example: variable and class names, data, domain concepts, repositories, configuration, and permissions.

**Use well-known names from the world, business and technical domains.** Doing so maintains a common vocabulary which makes communication more efficient. Avoid overloading such names with different meanings.

**Avoid letting poor/inconsistent names from other contexts creep in to the code.** Such contexts include legacy code, libraries, and other applications we interact with. Establish a boundary within which these naming guidelines are adhered to, and defend it from outside pollution.

**It's ok for user-facing names to be different.** Names shown on the UI/output are often requirements, and appear in their own context. When such names are poor or not appropriate from a code perspective, use a different one where possible.

**Use acronyms and abbreviations sparingly.** Code is generally clearer and easier to read without them. Universally accepted ones like *id* are an exception to this rule, including ones from the business domain.

**Avoid unnecessarily long names.** Aim not to be any longer than required to convey meaning. Long names increase the need for statements and method calls to span multiple lines, which makes code less readable. This rule implies avoiding use of a type's full name as a variable/parameter name where not necessary.

**Avoid over qualifying names.** When context for a name has already been established, for example by being within a class or method, it's not necessary to re-state that context. A *task*, for example, doesn't need a *taskCompleted*.

**Avoid overusing "get" as a method name prefix.** Getters return values. Prefer more informative alternatives such as "request", "fetch", "find", or "query" where appropriate.

**Consider renaming existing items when adding a new one causes ambiguity/conflict.** This often yields greater clarity than only qualifying the new one to distinguish it.

**Consider naming related things so they appear together in alphabetical order.** This aids discoverability when using an alphabetical ordering convention. *Example: data, dataError, dataLoaded.*

**Methods should always do what their names promise.** Method names convey expectations, and callers will be surprised if they aren't met. Avoid conditionally not doing what the name promises, and [throw an exception if unable to do what the name promises](https://www.hanselman.com/blog/IfYourMethodCantDoWhatItsNamePromisesItCanThrow.aspx).

**Use meaningful type parameter names where a single letter is unclear.** This improves readability. Use an established convention (e.g. "T" suffix) to distinguish them from type names.

**Avoid camelCasing compound words.** They are single words in their own right, so don't require it. *Examples: callback, password.*

**Spell correctly and consistently.** Doing so helps avoid errors, and improves code searchability. Where multiple correct spellings exist (e.g. "color"), follow platform conventions.

**Follow existing conventions around you.** These may be in a particular method, the codebase as a whole, or the technology/platform you're working with. Strive for consistency, and avoid doing differently without good reason.

----

This Gist may be useful: [List of names that tend to be useful in programming](https://gist.github.com/robatwilliams/1f089398144867e629bdc343a5cc5be6)
