# Code fashion

*"Fashion" here refers to non-stylistic approaches/techniques, and is chosen to distinguish it from [formatting](formatting.md).*

----

## Objects and classes

**Favour immutability.** Immutable objects are generally simpler and less error-prone to use than mutable ones. This is especially true in a multi-threaded context.

**Prevent construction of invalid objects.** Invalid objects will typically cause a problem sooner or later. It's better to fail early (see: [code flow](code-flow.md)) by having their constructor/factory validate them.

**Avoid passing around partially initialised/populated objects.** Doing so makes it difficult to follow the creation process, and risks them being used before initialisation is finished.

**Avoid multi-purpose data classes.** These are typically data or DTO (data transfer object) classes, partially populated in different ways and used for different purposes, when multiple things that need representing are quite similar apart from a few fields. They obscure what the actual domain items look like, are error-prone, and are difficult to refactor away.


## Logic

**Base logic on identifiers, not names.** Names are generally not guaranteed to be unique, and are prone to change. Identify things using their identifiers to drive logic.

**Avoid reversing conditionals through negating the expression.** Handling the `false` case in the else block makes the construct easier to follow, especially when there are multiple `else if` cases.
