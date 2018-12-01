# Code structure


## General readability and maintainability

**Split up long/big things.** This includes files, folders, methods, and templates. Having many lines/files/parts is an indication that something is doing too many things, which makes it difficult to understand, maintain, and adapt. Look for abstractions and responsibilities where a split could be made.

**Avoid drive-by code addition.** Think about where new code should go. It can sometimes appear convenient to accomplish a task by adding a few lines/methods here and there to existing methods/classes. However, just because somewhere is a convenient place to put something doesn't mean it should go there - consider if new methods/classes should be created. *Further reading: [Detecting Refactoring Diligence, by Michael Feathers](https://michaelfeathers.silvrback.com/detecting-refactoring-diligence)*

**Avoid non-trivial nested functions/lambdas.** Code can often be made clearer by extracting them to top-level or member functions.

**Avoid long parameter lists.** They are prone to callers passing parameters in the wrong order, even with the helping hand of IDEs. This is especially the case in untyped languages, or when parameters are of the same type. Use a parameters object or a builder instead.

**Strive to only depend on close/related things.** Changing far-away code/behaviour shouldn't break things. Where unavoidable, document such relationships. See [comments](comments.md).
