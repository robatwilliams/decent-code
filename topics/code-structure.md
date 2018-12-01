# Code structure


## General readability and maintainability

**Split up long/big things.** This includes files, folders, methods, and templates. Having many lines/files/parts is an indication that something is doing too many things, which makes it difficult to understand, maintain, and adapt. Look for abstractions and responsibilities where a split could be made.

**Avoid drive-by code addition.** Think about where new code should go. It can sometimes appear convenient to accomplish a task by adding a few lines/methods here and there to existing methods/classes. However, just because somewhere is a convenient place to put something doesn't mean it should go there - consider if new methods/classes should be created. *Further reading: [Detecting Refactoring Diligence, by Michael Feathers](https://michaelfeathers.silvrback.com/detecting-refactoring-diligence)*

**Avoid non-trivial nested functions/lambdas.** Code can often be made clearer by extracting them to top-level or member functions.

**Strive to only depend on close/related things.** Changing far-away code/behaviour shouldn't break things. Where unavoidable, document such relationships. See [comments](comments.md).


## Separation and encapsulation of responsibilities

**Avoid mixing different types of responsibilities in the same class/method.** Each one should generally be involved in one kind of responsibility. Avoid mixing data structure manipulation with business logic, or UI behaviour logic with the DOM operations that carry it out, for example.

**Avoid breaching separation of layers.** There is almost always a way of achieving what's needed, without resorting to this. Concepts within each layer should remain abstracted away (i.e. not at all visible) to lower or higher layers. For example, a data layer has no awareness of HTTP requests or response codes, and a service layer has no awareness of JDBC. See [error handling](error-handling.md).

**Avoid violating or by-passing applied design patterns.** When patterns or other design features have been put in place, avoid by-passing, subverting, or dismantling them.

**Encapsulate application-wide conventions.** Repeating even seemingly trivial conventions makes them difficult to identify, apply consistently, and modify. Conventions could be functionality-related (e.g. display of numbers/dates), or code-related (e.g. our pattern for implementing X). Some techniques can be applied in a single place (e.g. serializer configuration), while others are defined in a single place but need to be used/applied by the programmer wherever relevant (e.g. components, utility functions).
