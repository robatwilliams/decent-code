# Code flow


## General

**Avoid doing significant work in constructors.** This often limits flexibility around constructing and initialising the class, usually resulting in it being difficult to test.

**Beware of excessive similar conditionals.** They can be a sign of a missing or ill-fitting abstraction, or a general a need to improve the design.

**Handle edge cases.** Beware only considering the most common scenario. Examples include no data, invalid data, boundary conditions, errors, and null values (where appropriate).

**Avoid running unnecessary code.** If the work is done and the return value is ready, then return. Running additional code wastes time, and obscures the intent for those reading it.


## Methods

**Methods should stand alone, generally.** Avoid methods which always require a "companion method" to be called first/afterwards, for example to check preconditions or retrieve a result/error.

**Guard from outside against expected invalid calls.** In expected cases where it doesn't make sense to call the method, avoid calling it - instead of implementing it to handle invalid/meaningless cases. For example, an input form validator for number of decimal places would not expect to be called with anything other than a number.


## Defaults

**Avoid inappropriate defaulting.** Opportunities for using defaults include local/member variables, method arguments, and configuration values. Before creating a default, consider whether it's helpful, and weigh it against its potential to hide mistakes or be used accidentally and unknowingly.

**Avoid defaulting collections to be empty while data is loading.** Doing so removes/hides the distinction between loading states and no-data states, often leading to inappropriate/missing handling.

*Further reading on defaults: my article on [Default values in code and configuration](https://blog.scottlogic.com/2018/11/22/default-values-in-code-and-configuration.html)*


## Checks

**Avoid unnecessary null checks.** There are some things in the technical and business logic domains that we can fairly confidently rely on not to ever be null. Adding explicit checks for them can hide problems, and they bloat the code.

**Avoid inappropriate null/state checks (or those in inappropriate locations) that patch over underlying issues.** These are usually checks that skip/branch logic in invalid or edge-case scenarios, done in one place to avoid/conceal a problem that has originated elsewhere. Instead, prefer to address/fix the root cause issue. Also be aware of checks in callers that should be in callees, and vice versa.


## Handling unhappy path situations

**Fail early and loud, rather than later/quietly.** Detect problems at the earliest opportunity, and make them visible, for example by throwing an error. Avoid detecting and then hiding problems silently by skipping some code or using a default value. Examples include initialisation checks, validity checks, method preconditions, and API response status checks. See [Functional](functional.md) > fail fast.

**Defensive code vs. strict expectations.** Writing defensive code to be accommodating of surrounding problems is an approach that can be used to make applications more robust - working around problems instead of allowing them to cause a failure. A major downside however, is that it makes those problems less visible - in turn making them less likely to be noticed and addressed. It also complicates the code with possibly unnecessary "just in case" handling. For a given area of your application, weigh up the costs and benefits to help decide whether a defensive or strict approach is most appropriate. At a system boundary where an application is interacting with something external outside its control for example, the case for being defensive is more likely to be compelling.
