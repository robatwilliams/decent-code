# General programming


## General

**Prefer a functional approach to an imperative one.** Less mutable state and side-effects make code less error-prone, and easier to reason about.

**Minimise held state.** State of any form (e.g. variables, caches) tends to be a source of complexity and problems, so it's best to keep as little of it around as necessary. Prefer to derive information when needed, to storing it, if constraints allow.

**Help compilers/transpilers and static analysis tools to help you.** These tools can detect problems in code before it's even run, giving a shorter feedback loop. Be aware of the problems your tools can detect, and write code to help them. For example, use annotations such as `@Override`, use constant variables, avoid unnecessarily initialising variables, avoid subverting the type safety system, and avoid suppressing warnings.

**Think carefully before suppressing a static analysis warning or disabling entirely the rule that caused it.** Consider why the rule was enabled and configured thus in the first place. Rule documentation pages usually describe the motivation for the rule. You may be going against best practice (or project practice), or using an error-prone or deprecated technique. *Further reading: [Chesterton's fence](https://en.wikipedia.org/wiki/Wikipedia:Chesterton%27s_fence)*


## Objects and classes

**Favour immutability.** Immutable objects are generally simpler and less error-prone to use than mutable ones. This is especially true in a multi-threaded context.

**Prevent construction of invalid objects.** Invalid objects will typically cause a problem sooner or later. It's better to fail early (see: [code flow](code-flow.md)) by having their constructor/factory validate them.

**Avoid passing around partially initialised/populated objects.** Doing so makes it difficult to follow the creation process, and risks them being used before initialisation is finished.

**Avoid multi-purpose data classes.** These are typically data or DTO (data transfer object) classes, partially populated in different ways and used for different purposes, when multiple things that need representing are quite similar apart from a few fields. They obscure what the actual domain items look like, are error-prone, and are difficult to refactor away.


## Data and values

**Create and use data types that model the domain.** Avoid using strings for everything just because it's possible and appears to be convenient. Domain-based data types are key to object oriented programming, provide natural homes for many methods, and provide the compiler with information it can use to detect erroneous usage.

**Include units of measurement/magnitude in domain data types.** This empowers the domain model together with the compiler to guard against invalid calculations. This is akin to the use of dimensional analysis of a derived physics equation's input and output units in order to verify that it was derived correctly. It also removes the need for including the unit (e.g. MWh) in property/variable names.

**Extract constants for magic numbers, generally.** There are however some cases where doing so adds noise, such as for zero.


## Methods

**Avoid doing things the caller wouldn't reasonably expect.** The method name conveys expectations - avoid surprising side-effects.

**Return early for failed preconditions.** Avoiding the need for most/all of the method to be in an if-statement (or many nested ones) makes it easier to read.

**Avoid long parameter lists.** They are prone to callers passing parameters in the wrong order, even with the helping hand of IDEs. This is especially the case in untyped languages, or when parameters are of the same type. Use a parameters object or a builder instead.

**Order parameters intuitively.** Put the more important parameters nearer the first. Put related ones next to each other. One trick to help with choosing an intuitive order is to construct a sentence describing a call to the method; the parameters often fall naturally into an order within the sentence.

**Order parameters consistently.** Where there are overloads, or many methods taking similar parameters, all the methods should take the common parameters first.

**Avoid Boolean parameters.** When reading calling code, Boolean parameters make it difficult to know the intent of calls. Consider a two-element enum, a parameters object, or a separate method for each case. *Further reading: [The Pitfalls of Boolean Trap](https://ariya.io/2011/08/hall-of-api-shame-boolean-trap)*


## Logic

**Base logic on identifiers, not names.** Names are not generally guaranteed to be unique, and are prone to change. Identify things using their identifiers to drive logic.

**Avoid reversing conditionals through negating the expression.** Handling the `false` case in the else block makes the construct easier to follow, especially when there are multiple `else if` cases.
