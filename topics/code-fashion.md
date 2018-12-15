# Code fashion

*"Fashion" here refers to non-stylistic approaches/techniques, and is chosen to distinguish it from [formatting](formatting.md).*

----

## Objects and classes

**Favour immutability.** Immutable objects are generally simpler and less error-prone to use than mutable ones. This is especially true in a multi-threaded context.

**Prevent construction of invalid objects.** Invalid objects will typically cause a problem sooner or later. It's better to fail early (see: [code flow](code-flow.md)) by having their constructor/factory validate them.

**Avoid passing around partially initialised/populated objects.** Doing so makes it difficult to follow the creation process, and risks them being used before initialisation is finished.

**Avoid multi-purpose data classes.** These are typically data or DTO (data transfer object) classes, partially populated in different ways and used for different purposes, when multiple things that need representing are quite similar apart from a few fields. They obscure what the actual domain items look like, are error-prone, and are difficult to refactor away.


## Methods

**Avoid doing things the caller wouldn't reasonably expect.** The method name conveys expectations - avoid surprising side-effects.

**Return early for failed preconditions.** Avoiding the need for most/all of the method to be in an if-statement (or many nested ones) makes it easier to read.

**Avoid long parameter lists.** They are prone to callers passing parameters in the wrong order, even with the helping hand of IDEs. This is especially the case in untyped languages, or when parameters are of the same type. Use a parameters object or a builder instead.

**Order parameters intuitively.** Put the more important parameters nearer the first. Put related ones next to each other. One trick to help with choosing an intuitive order is to construct a sentence describing a call to the method; the parameters often fall naturally into an order within the sentence.

**Order parameters consistently.** Where there are overloads, or many methods taking similar parameters, all the methods should take the common parameters first.

**Avoid Boolean parameters.** When reading calling code, Boolean parameters make it difficult to know the intent of calls. Consider a two-element enum, a parameters object, or a separate method for each case. Read more: [The Pitfalls of Boolean Trap](https://ariya.io/2011/08/hall-of-api-shame-boolean-trap).


## Logic

**Base logic on identifiers, not names.** Names are generally not guaranteed to be unique, and are prone to change. Identify things using their identifiers to drive logic.

**Avoid reversing conditionals through negating the expression.** Handling the `false` case in the else block makes the construct easier to follow, especially when there are multiple `else if` cases.
