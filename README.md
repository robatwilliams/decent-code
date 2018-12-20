# decent-code
> A concise guide to writing better code

A guide/checklist to help people level-up their coding and code-reviewing. It's about 25 pages of A4 size 11 text.

[Jump to Contents](#contents)


## Motivation
It can be hard to maintain consistency and quality while scaling code review.

It's rarely practical for everyone or any one person to review every single line of code, while also getting on with their own work and responsibilities. As reviewers we all have our own experience, technical/project knowledge, and proficiency level. Individually applying these improves code quality, but it's a reactive approach and tends not to be consistent.

By having, and through creating, a shared reference for practices and quality, a team can go some way towards overcoming these issues.

This is a personal guide, based on some of the things I look out for. I hope it can help you write better code, be a more effective reviewer, and pique your interest in further learning.


## Code review

Code review is more than a checklist process, but many of the things we look for are simple and there are too many of them to remember. Checklists help us remember, and inform contributors upfront of expectations. This helps reviewers' time to be better spent on the bigger and less simple things, and reduce contributors' time spent on revisions.

Those items that can be automated should be (using tools like ESLint and its plugins, or Checkstyle). Manual detection and correction isn't reliable, doesn't scale well, and consumes focus better spent elsewhere.


## What this isn't
This isn't a style guide, a declaration of The Right Way, a comprehensive guide to writing good code and being a good contributor, or a shortcut to becoming a good developer. Things that should be picked up by appropriately configured automated tools are generally not mentioned. To read about review process, conduct, collaboration, and tools, check out [the code review awesome list](https://github.com/joho/awesome-code-review).


## Contents
1. [Naming things](#naming-things)
1. [Code flow](#code-flow)
1. [Code structure](#code-structure)
1. [General programming](#general-programming)
1. [Functional](#functional)
1. [Error handling](#error-handling)
1. [Logging](#logging)
1. [Tests](#tests)
1. [Files](#files)
1. [Formatting](#formatting)
1. [Dependencies](#dependencies)
1. Tech specifics
   1. [CSS](#tech-css)
   1. [HTML](#tech-html)
   1. [Java](#tech-java)
   1. [JavaScript](#tech-javascript)
1. [Comments](#comments)
1. [Commits](#commits)
1. [Pull request](#pull-request)
1. [Features](#features)
1. [UI text](#ui-text)
1. [Bug fixes](#bug-fixes)
1. [Meta](#meta)


## Further reading
The following books on generally writing good code are popular and highly-rated.

* [97 Things Every Programmer Should Know](https://www.goodreads.com/book/show/7003902-97-things-every-programmer-should-know) *(free to [read online](https://github.com/97-things/97-things-every-programmer-should-know)*)
* [Clean Code](https://www.goodreads.com/book/show/3735293-clean-code)
* [Code Complete](https://www.goodreads.com/book/show/4845.Code_Complete)





----------------------------------------

## Naming things

> There are only two hard things in Computer Science: cache invalidation and naming things
>
> &mdash; <cite>Phil Karlton<cite>

**One name for each thing, and each name used for only one thing.** Using multiple words to mean the same thing, or the same word to mean different things, wastes cognitive effort and is likely to cause confusion. This not only applies to code, but to everything in the context of our work, for example: variable and class names, method names, data, domain concepts, repositories, configuration, and permissions.

**Use well-known names from the world, business and technical domains.** Doing so maintains a common vocabulary which makes communication more efficient. Avoid overloading such names with different meanings.

**Use names which convey meaning.** Meaning is key to being able to understand code. Generic names such as "data" or "value" are less informative.

**Avoid letting poor/inconsistent names from other contexts creep in to the code.** Such contexts include legacy code, libraries, and other applications we interact with. Establish a boundary within which these naming guidelines are adhered to, and defend it from outside pollution.

**It's ok for user-facing names to be different.** Names shown on the UI/output are often requirements, and appear in their own context. When such names are poor or not appropriate from a code perspective, use a different one where possible.

**Use acronyms and abbreviations sparingly.** Code is generally clearer and easier to read without them. Universally accepted ones like *id* are an exception to this rule, including ones from the business domain.

**Avoid unnecessarily long names.** Aim not to be any longer than required to convey meaning. Long names increase the need for statements and method calls to span multiple lines, which makes code less readable. This rule implies avoiding use of a type's full name as a variable/parameter name where not necessary.

**Avoid over qualifying names.** When context for a name has already been established, for example by being within a class or method, it's not necessary to re-state that context. A *task*, for example, doesn't need a `taskCompleted`.

**Use positive names for Booleans, and avoid negation within the name.** Negative names cause double negatives, which make expressions harder to grasp (consider `enabled: true` vs. `disabled: false`). Using the word "not" has the same issue.

**Avoid overusing "get" as a method name prefix.** Getters return values. Prefer more informative alternatives such as "request", "fetch", "find", "query", "build", or "create" where appropriate.

**Strive for distinctive names within the same context.** Similar names are easy to mix up, and make code difficult to read.

**Consider qualifying every name when it becomes necessary to qualify one.** This often yields greater clarity/distinctiveness than only qualifying one to distinguish it, and makes it more likely that the correct one will be chosen for use in the appropriate places. *Example: `previousFoo` & `nextFoo`, instead of `previousFoo` & `foo`.*

**Consider naming related things so they appear together in alphabetical order.** This aids discoverability when using an alphabetical ordering convention. *Example: `data`, `dataError`, `dataLoaded`.*

**Methods should always do what their names promise.** Method names convey expectations, and callers will be surprised if they aren't met. Avoid conditionally not doing what the name promises, and [throw an exception if unable to do what the name promises](https://www.hanselman.com/blog/IfYourMethodCantDoWhatItsNamePromisesItCanThrow.aspx).

**Use meaningful type parameter names where a single letter is unclear.** This improves readability. Use an established convention (e.g. "T" suffix) to distinguish them from type names.

**Avoid camelCasing compound words.** They are single words in their own right, so don't require it. *Examples: callback, password.*

**Spell correctly and consistently.** Doing so helps avoid errors, and improves code searchability. Where multiple correct spellings exist (e.g. "color"), follow platform conventions.

**Follow existing conventions around you.** These may be in a particular method, the codebase as a whole, or the technology/platform you're working with. Strive for consistency, and avoid doing differently without good reason.

----

This Gist may be useful: [List of names that tend to be useful in programming](https://gist.github.com/robatwilliams/1f089398144867e629bdc343a5cc5be6)





----------------------------------------

## Code flow


### General

**Avoid doing significant work in constructors.** This often limits flexibility around constructing and initialising the class, usually resulting in it being difficult to test.

**Beware of excessive similar conditionals.** They can be a sign of a missing or ill-fitting abstraction, or a general a need to improve the design.

**Handle edge cases.** Beware only considering the most common scenario. Examples include no data, invalid data, boundary conditions, errors, and null values (where appropriate).

**Avoid running unnecessary code.** If the work is done and the return value is ready, then return. Running additional code wastes time, and obscures the intent for those reading it.


### Methods

**Methods should stand alone, generally.** Avoid methods which always require a "companion method" to be called first/afterwards, for example to check preconditions or retrieve a result/error.

**Guard from outside against expected invalid calls.** In expected cases where it doesn't make sense to call the method, avoid calling it - instead of implementing it to handle invalid/meaningless cases. For example, an input form validator for number of decimal places would not expect to be called with anything other than a number.


### Defaults

**Avoid inappropriate defaulting.** Opportunities for using defaults include local/member variables, method arguments, and configuration values. Before creating a default, consider whether it's helpful, and weigh it against its potential to hide mistakes or be used accidentally and unknowingly.

**Avoid defaulting collections to be empty while data is loading.** Doing so removes/hides the distinction between loading states and no-data states, often leading to inappropriate/missing handling.

*Further reading on defaults: my article on [Default values in code and configuration](https://blog.scottlogic.com/2018/11/22/default-values-in-code-and-configuration.html)*


### Checks

**Avoid unnecessary null checks.** There are some things in the technical and business logic domains that we can fairly confidently rely on not to ever be null. Adding explicit checks for them can hide problems, and they bloat the code.

**Avoid inappropriate null/state checks (or those in inappropriate locations) that patch over underlying issues.** These are usually checks that skip/branch logic in invalid or edge-case scenarios, done in one place to avoid/conceal a problem that has originated elsewhere. Instead, prefer to address/fix the root cause issue. Also be aware of checks in callers that should be in callees, and vice versa.


### Handling unhappy path situations

**Fail early and loud, rather than later/quietly.** Detect problems at the earliest opportunity, and make them visible, for example by throwing an error. Avoid detecting and then hiding problems silently by skipping some code or using a default value. Examples include initialisation checks, validity checks, method preconditions, and API response status checks. See [Functional](#functional) > fail fast.

**Defensive code vs. strict expectations.** Writing defensive code to be accommodating of surrounding problems is an approach that can be used to make applications more robust - working around problems instead of allowing them to cause a failure. A major downside however, is that it makes those problems less visible - in turn making them less likely to be noticed and addressed. It also complicates the code with possibly unnecessary "just in case" handling. For a given area of your application, weigh up the costs and benefits to help decide whether a defensive or strict approach is most appropriate. At a system boundary where an application is interacting with something external outside its control for example, the case for being defensive is more likely to be compelling.





----------------------------------------

## Code structure


### General readability and maintainability

**Split up long/big things.** This includes files, folders, methods, and templates. Having many lines/files/parts is an indication that something is doing too many things, which makes it difficult to understand, maintain, and adapt. Look for abstractions and responsibilities where a split could be made.

**Avoid drive-by code addition.** Think about where new code should go. It can sometimes appear convenient to accomplish a task by adding a few lines/methods here and there to existing methods/classes. Perhaps add a few "flag" parameters to skip some parts of some methods. However, just because somewhere is a convenient place to put something doesn't mean it should go there - consider if new methods/classes should be created. *Further reading: [Detecting Refactoring Diligence](https://michaelfeathers.silvrback.com/detecting-refactoring-diligence), by Michael Feathers*

**Avoid non-trivial nested functions/lambdas.** Code can often be made clearer by extracting them to top-level or member functions.

**Strive to only depend on close/related things.** Changing far-away code/behaviour shouldn't break things. Where unavoidable, document such relationships. See [comments](#comments).


### Separation and encapsulation of responsibilities

**Avoid mixing different types of responsibilities in the same class/method.** Each one should generally be involved in one kind of responsibility. Avoid mixing data structure manipulation with business logic, or UI behaviour logic with the DOM operations that carry it out, for example.

**Avoid breaching separation of layers.** There is almost always a way of achieving what's needed, without resorting to this. Concepts within each layer should remain abstracted away (i.e. not at all visible) to lower or higher layers. For example, a data layer has no awareness of HTTP requests or response codes, and a service layer has no awareness of JDBC. See [error handling](#error-handling).

**Avoid violating or by-passing applied design patterns.** When patterns or other design features have been put in place, avoid by-passing, subverting, or dismantling them.

**Encapsulate application-wide conventions.** Repeating even seemingly trivial conventions makes them difficult to identify, apply consistently, and modify. Conventions could be functionality-related (e.g. display of numbers/dates), or code-related (e.g. our pattern for implementing X). Some techniques can be applied in a single place (e.g. serializer configuration), while others are defined in a single place but need to be used/applied by the programmer wherever relevant (e.g. components, utility functions).


### Ordering

**Think about the order of things, generally.** Ordering things (e.g. methods, config files) in a well-thought-out way makes it quicker and easier to find what you're looking for. This includes determining if it exists at all. It also helps you notice related things you weren't looking for but should probably be aware of. The best order for most things isn't by the time in which they were added. Some things need individual judgement, while others are partially/completely well-defined (e.g. alphabetical, [lifecycle methods](https://github.com/yannickcr/eslint-plugin-react/blob/master/docs/rules/sort-comp.md)).

**Order lifecycle methods in the order that they're called.** It's intuitive to use this already-established and familiar order.

**Put related methods together.** It's easier to follow what code is doing when not much navigation around the file is needed.

**Put important code at the top, and less important code at the bottom.** This is known as "newspaper code structure"; start with the important (headline), then read on for further detail in descending order of significance (summary paragraph, full article text). It allows the reader to quickly understand the key things about the file without needing to scan over all of it. Applying this as an example, constructors would go near the top, and helper methods and getters/setters would go at the bottom.





----------------------------------------

## General programming


### Writing, reading, and working with code

**Code should be easy to follow.** After writing a piece of code (and tests for it, if appropriate), consider if it could be refactored to make it clearer. Clear code consumes less mental energy to understand, leaving more spare for better uses.

**Code should be easy to use right, and hard to use wrong.** It should guide people down the right path naturally. It should get in the way and make things difficult when someone tries to use it wrongly.

**Code should be easy to change right, and hard to change wrong.** It should help people decide what to change, and where to do it. It should resist when someone tries to change it wrongly (break it), and cause test failures.

**Minimise the odd, the unusual, and cleverness.** Prefer simplicity and clarity. Write boring code, and write it to help others (and your future self) rather than attempt to impress them.


### General

**Prefer a functional approach to an imperative one.** Less mutable state and side-effects make code less error-prone, and easier to reason about.

**Minimise held state.** State of any form (e.g. variables, caches) tends to be a source of complexity and problems, so it's best to keep as little of it around as necessary. Prefer to derive information when needed, to storing it, if constraints allow.

**Help compilers/transpilers and static analysis tools to help you.** These tools can detect problems in code before it's even run, giving a shorter feedback loop. Be aware of the problems your tools can detect, and write code to help them. For example, use annotations such as `@Override`, use constant variables, avoid unnecessarily initialising variables, avoid subverting the type safety system, and avoid suppressing warnings.

**Think carefully before suppressing a static analysis warning or disabling entirely the rule that caused it.** Consider why the rule was enabled and configured thus in the first place. Rule documentation pages usually describe the motivation for the rule. You may be going against best practice (or project practice), or using an error-prone or deprecated technique. *Further reading: [Chesterton's fence](https://en.wikipedia.org/wiki/Wikipedia:Chesterton%27s_fence)*


### Objects and classes

**Favour immutability.** Immutable objects are generally simpler and less error-prone to use than mutable ones. This is especially true in a multi-threaded context.

**Prevent construction of invalid objects.** Invalid objects will typically cause a problem sooner or later. It's better to fail early (see: [code flow](#code-flow)) by having their constructor/factory validate them.

**Avoid passing around partially initialised/populated objects.** Doing so makes it difficult to follow the creation process, and risks them being used before initialisation is finished.

**Avoid multi-purpose data classes.** These are typically data or DTO (data transfer object) classes, partially populated in different ways and used for different purposes, when multiple things that need representing are quite similar apart from a few fields. They obscure what the actual domain items look like, are error-prone, and are difficult to refactor away.


### Data and values

**Create and use data types that model the domain.** Avoid using strings for everything just because it's possible and appears to be convenient. Domain-based data types are key to object oriented programming, provide natural homes for many methods, and provide the compiler with information it can use to detect erroneous usage.

**Include units of measurement/magnitude in domain data types.** This empowers the domain model together with the compiler to guard against invalid calculations. This is akin to the use of dimensional analysis of a derived physics equation's input and output units in order to verify that it was derived correctly. It also removes the need for including the unit (e.g. MWh) in property/variable names.

**Extract constants for magic numbers, generally.** There are however some cases where doing so adds noise, such as for zero.


### Methods

**Avoid doing things the caller wouldn't reasonably expect.** The method name conveys expectations - avoid surprising side-effects.

**Return early for failed preconditions.** Avoiding the need for most/all of the method to be in an if-statement (or many nested ones) makes it easier to read.

**Avoid long parameter lists.** They are prone to callers passing parameters in the wrong order, even with the helping hand of IDEs. This is especially the case in untyped languages, or when parameters are of the same type. Use a parameters object or a builder instead.

**Order parameters intuitively.** Put the more important parameters nearer the first. Put related ones next to each other. One trick to help with choosing an intuitive order is to construct a sentence describing a call to the method; the parameters often fall naturally into an order within the sentence.

**Order parameters consistently.** Where there are overloads, or many methods taking similar parameters, all the methods should take the common parameters first.

**Avoid Boolean parameters.** When reading calling code, Boolean parameters make it difficult to know the intent of calls. Consider a two-element enum, a parameters object, or a separate method for each case. *Further reading: [The Pitfalls of Boolean Trap](https://ariya.io/2011/08/hall-of-api-shame-boolean-trap), by Ariya Hidayat*


### Logic

**Base logic on identifiers, not names.** Names are not generally guaranteed to be unique, and are prone to change. Identify things using their identifiers to drive logic.

**Avoid reversing conditionals through negating the expression.** Handling the `false` case in the else block makes the construct easier to follow, especially when there are multiple `else if` cases.





----------------------------------------

## Functional

**The feature works in all supported browsers.** This includes aspects off the main usage path for the feature. Internet Explorer in particular needs watching out for. See [Tech: JavaScript](#tech-javascript) > feature support.

**The feature works in the "prod mode" build (if applicable).** Development modes, which are often used to improve the developer experience (productivity), make the running application less like what the production version will be. Testing while using such modes can result in undetected problems, and also typically reduces performance.

**Error cases are handled.** Depending on the nature of the error, this includes: detection, logging, recovery/abort, and notifying the user. See [error handling](#error-handling).

**Fail fast, and fail proactively.** Detect problems at the earliest opportunity, and make them immediately and clearly visible (e.g. log, UI message, application abortion). Avoid allowing the application to continue into undefined states - hoping for the best. The "fast and proactive" strategy makes problems from many facets (e.g. code, configuration, infrastructure) easier to find and diagnose, findable sooner, and helps avoid collateral damage. For example, an application would fail at startup if a database/API connection cannot be established - rather than doing so the first time its API is called. Another example: an application would fail at startup if the configuration (or permutation of user permissions) is invalid - rather than doing so if/when a particular feature is used, falling back to a default value, or continuing execution anyway.

**Date, time, time zones, and summer/winter time transitions are handled correctly.** Understand the concepts of time, and have a consistent application-wide strategy for dealing with them. Use a library/SDK for manipulating time, and treat manual manipulation as a warning sign (it's with good reason that libraries don't support some operations: they don't make sense). Take care not to break the "opposite case" when fixing summer/winter time problems (or transition-related ones). Applications shouldn't usually include unit tests for libraries they use, but consider making an exception in this area for non-trivial cases - not to test the library, but to test that you're using it correctly.

**Requests/calls for data are well thought-out.** They are made at appropriate moments, not repeated unnecessarily, and don't return excessive volume beyond what the application needs (use paging/limits). Caching is used where appropriate, and disabled where not. Examples include requests to APIs, and database calls.

**Secondary UI states are handled.** These include: loading, error, no data, and too much data to show at once.





----------------------------------------

## Error handling


### General

**Throw exceptions in the domain of the method's interface.** This avoids breaching abstractions or application layers. For example, DAOs shouldn't throw HTTP exceptions, and neither should they propagate JDBC exceptions. Exceptions can be caught and wrapped in more appropriate ones to facilitate this.

**Either log exceptions, or throw them - not both, generally.** Thrown exceptions will be caught at some level; if the lower level thrower can't handle the exception then it's likely not best placed to decide that it should be logged, and to do so informatively with context. Widespread log-and-throw also leads to duplicate logging as an exception bubbles up the call hierarchy. An exception to the rule is when that higher level is outside our control (e.g. a framework) - and doesn't log, logs at an undesirable level, or doesn't include sufficient detail.


### Control flow

**Throw an exception from a method that can't do what its name promises.** The name [conveys expectations](https://www.hanselman.com/blog/IfYourMethodCantDoWhatItsNamePromisesItCanThrow.aspx), and the caller needs to be informed if they cannot be met.

**Avoid logging errors and continuing execution regardless.** Such practice is not meaningful error handling, and is likely to cause follow-on errors and damage. Execution in the current context should stop, or take some alternate recovery path.


### Information management and capture

**Include relevant and contextual information in exception/log messages.** Such information aids diagnosis of problems. Examples include problematic values, state, and identifiers. For custom exceptions, some of this information can be made mandatory in the constructor as opposed to the common practice of accepting a single string message.

**Consider catch-wrap-rethrow to add a more helpful message and/or contextual information.** The original thrower may not have had much context or data to construct a particularly useful message. Callers of such throwers can catch such exceptions and wrap them in more informative exceptions before throwing those further.

**Log caught exceptions in full, generally.** Logging only a generic message, or only the caught exception's message, discards potentially useful information - the messages of wrapped cause-exceptions, and the stack trace. At a system boundary (e.g. when exposing an API), it's usually desirable to omit (or log at a lower level) the detail of client errors (e.g. request validation) to avoid excessive log noise.


### Web APIs

**Respond with an appropriate error response code, and an informative body including further detail.** This allows clients to quickly identify the nature of the problem without needing to consult service logs. For example, a response may indicate a bad request together with an explanation of what was wrong with it.

**Avoid revealing (or making inferable) sensitive information or implementation details in error responses.** Sensitive information is anything the client shouldn't know about (even it it isn't shown in the UI they're using), such as the existence of data they don't have access to, or restrictions/limits that are in place on their account. Revealing implementation details could aid attackers, either of the application or others in the organisation. Many web frameworks have features and/or encouraged patterns for handling this issue centrally and consistently.


### User interface

**Show appropriate and helpful information to the user.** The main body should communicate in non-technical terms what the problem is, the current state of what the user was doing, and a path to rectifying the problem. Technical detail may be included in a revealable area for inclusion on bug reports.

**Only ask the user to try again if the problem is transient.** Trying again after a connection problem may well work. Trying again with the same invalid form input certainly won't.

*Also see: [UI text](#ui-text)*





----------------------------------------

## Logging


### General

**Bear in mind the purpose of logging.** The main ones are: determining if the application is running smoothly, and diagnosing what the problem is if it isn't running smoothly. Having these in mind helps when deciding if we should log, and if so, what information should be included. There should be some "tickover" `INFO` logging while the application is in use, to indicate that everything's fine. When things aren't fine, there should be `WARN` and `ERROR` logging to call attention to that, and detail what the problem is.

**Follow application conventions for when/what/how.** This ensures that all areas of the application log consistently.

**Avoid trivial, irrelevant, or duplicate logging.** Such logging is only noise, detracting from the "signal" of actually-important logging.

**Read logging output to ensure "flow".** It should read coherently, as a story of what's happening. Try reading it while exercising specific application tasks, and while a load test is underway.

**Avoid tightly coupled logging collaboration and dependencies.** Log messages should mostly be able to stand alone. They should remain meaningful if other distant log calls are modified or removed; that is, the complete log output should not be fragile. Avoid referring to, setting expectations of, building multi-message "sentences" in collaboration with, or relying on distant logging to "close off business you started".


### Content

Write **clear, concise, and unambiguous messages.** Messages which follow these principles are quicker and easier to understand, and help avoid misinterpretation or confusion.

**Include relevant and contextual information.** Such information aids diagnosis of problems. Examples include key values, state, and identifiers. For ease of searching and to allow parsing by log viewing tools, consider using a pattern such as `key=value | other=value`.

**Distinguish values from message text using delimiters.** Some types of data can be hard to distinguish from the log message template itself, when they are embedded within the message. Use delimiters such as quotes, braces, or angle brackets to clarify the boundaries where necessary.

**Use mapped diagnostic context (MDC) to distinguish logging from multiple threads.** It's almost impossible to gain an understanding of what's going on when logging output from multiple concurrent thread is interleaved. Including context information such as user/request IDs in individual log statements is tedious and repetitive. Instead, configure your logger's pattern to include such information on every line along with the timestamp.


### Levels

**Use levels appropriately and consistently.** Establish (or obtain) guidelines, and follow them. When the application is running smoothly for example, it shouldn't be spewing a deluge of errors and warnings.

**Client errors are not application errors.** If a client sends an invalid request or otherwise does something illegal/wrong, it's that client that's in the wrong - not the application handling the request. Logging such errors as application errors generates noise when a misbehaving or poorly-implemented client calls our application.


----

*Also see: [Error handling](#error-handling)*

*Further reading:*
* *[The Art of Logging](https://www.codeproject.com/Articles/42354/The-Art-of-Logging), by Colin Eberhardt*
* *[Log Level Inflation](https://marxsoftware.blogspot.com/2010/09/log-level-inflation.html), by Dustin Marx*
* *[Verbose Logging Will Disturb Your Sleep](https://github.com/97-things/97-things-every-programmer-should-know/blob/master/en/thing_90/README.md), by Johannes Brodwall*





----------------------------------------

## Tests


### General

**Tests are code, too.** The items from the other topics in this guide apply. They require code review, and are subject to the same automated and manual quality checks and rules as the main code. Poor test code is less reliable, and can make it difficult to change or refactor the main code.

**Keep test code close to the code they're testing.** Read: [files](#files).

**Single focus and purpose per test.** Tests with wide scope are less clear, and make it harder to identify the cause of failures. Aim for failures only related to the case described in the test name, and make assertions as required.


### What to test

**Balance value against cost.** Tests require effort to write and maintain. Consider for a given piece of code (however small) if the confidence you gain in its correctness and avoidance of future breakages is worth it against how time consuming and difficult it is to test. This item is not an excuse for antipatterns that make code difficult to test.

**Coverage is a guide; it does not imply adequacy nor inadequacy.** Coverage indicates which paths through the code were taken while executing the tests. It doesn't say anything about good choice of test cases, or making appropriate assertions. Tests for code giving high coverage may need improvement, and tests for code giving lower coverage may be perfectly adequate. Avoid writing low-value tests to bump up the coverage metrics.

**Avoid tests that test that the code "does what it does".** Such tests typically check that certain mocks are called, and don't test any logic of the unit under test (if the unit even has any). They are brittle, an overhead for refactoring, noise, and low-value.

**Avoid tests that test the mocking library.** Usually accidental, such tests assert nothing about our code and instead for example check that the method stubbing feature works.

**Include tests for edge cases and unhappy paths.** We need to be confident that our code works in all cases, not just the "normal" ones which may occur the vast majority of the time. Examples include errors, timeouts, invalid data, no data, and boundary values.


### Structure and isolation

**Avoid shared state between tests.** Shared state breaks test isolation, usually leading to a mess involving false passes or false failures depending on which tests are run together and in which order. Examples include shared variables (usually to avoid redeclaration), re-used test instances, and re-used mocks. Always start afresh, or in the case of mocks, reset them.

**Avoid shared setup logic in hooks.** This means block(s) of code that the test framework runs before a collection of individual tests. Taken to extreme, it involves nested groups of tests, with a shared setup block at each level. It encourages the use of shared state, allows accidental use of shared state, makes setup difficult to follow, makes tailoring setup for individual tests difficult, and makes it hard to modify tests and add new ones.

**Abstract common setup logic into utility functions.** This avoids pretty much all the issues that arise from using hooks. Extract shared setup logic into utility functions, and use them directly and as-needed from individual tests. The functions return objects ready for use in the test, and often accept parameters (data, or options) to allow tailoring the setup for individual tests. The latter makes it easy to see the difference in setup between each test.

**Avoid relying on the current system time and time zone.** Such tests don't test the same thing every time they're run, and are likely to cause issues in the future or when run by people or CI servers in different locations. Inject the current time into your code instead, allowing specific fixed times to be injected in tests.


### Assertions

**Use strict assertions.** These strengthen the test and make it more likely to detect future regressions. Examples include strict equality, and errors/exceptions of specific types with specific messages.

**Use the most appropriate assertions.** Test frameworks include assertions other than equality. They clarify the test code, and produce better failure messages.

**Ensure that assertions in asynchronous code are actually run.** Use test framework specific techniques to ensure they are run. Some frameworks provide synchronous [assertions](https://jestjs.io/docs/en/expect#expectassertionsnumber) that assert that later assertions are in fact made.


### Other

**Mock immediate dependencies rather than transitive ones.** This keeps the test independent and focused on the single unit.

**Avoid re-using mock runtime data as mock test data.** Such data is designed for a different purpose (demo, usually), and should remain modifiable without affecting the tests.

**Avoid waiting for elapsed clock time.** Tests that wait this way for asynchronous code and timers are slow to run; this becomes a big problem when you have hundreds of them. Instead, use your test framework's time-mocking facility which allows time to be advanced immediately.





----------------------------------------

## Files

**Named well and as per conventions.** Refer to [naming things](#naming-things). Follow project conventions (e.g. suffixes) and casing style.

**In an appropriate folder.** Considerations include purpose and functional area.

**Organised by functional separation, rather than by file type.** This means by application functional area / module, or component - not by file type (e.g. controllers, styles, DAOs). Structuring this way keeps related code together, which aids discoverability and navigation.

**Test files are close to the code they're testing.** The standard Java convention of separate `src` and `test` folders is the opposite of this. Having them nearby makes them easier to find, keeps them in peoples' minds, and makes it easy to notice missing ones. Practically, this means putting them in a sibling folder to the files they're testing.





----------------------------------------

## Formatting

*Almost all formatting issues should be automated through tools such as ESLint or Checkstyle. Violations should fail the build, lest they accumulate and make new ones hard to notice.*

*Local development (file-watch) builds need not fail on violations, lest it become an annoying inconvenience. Editor/IDE settings matching the requirements should be checked in and shared, for example using [EditorConfig](https://editorconfig.org/) files. Also consider running the automated checks using a source control pre-commit hook.*

*The following includes only the key things to get right; it's not a comprehensive set of settings for automated tools.*

----

**Use consistent line endings.** Source control tools consider otherwise identical lines with different ending breaks to be different. Mixing within a project will cause unnecessary diff noise (making code harder to review) and merge problems, especially when code is moved during refactoring.

**Use consistent indentation.** Another cause of "false differences". Mixing styles will cause the aforementioned problems.

**Avoid leaving trailing whitespace.** They're a source of "false differences", and there's no good reason to have them.

**End files with a line break.** This avoids the existing final line being considered as modified in a diff when you add a new line after it later.

**Use single blank lines judiciously to separate constructs and groups of statements.** Blank lines create visual separation between logical parts, making code easier to read. Dense code is harder to read. Examples include after a group of variable declarations, around an if-else statement, around logical parts of a method, and before a return statement.

**Avoid any unnecessary or unrelated changes to formatting, indentation etc.** They detract from the purpose of the work at hand, cause diff noise (and the aforementioned associated issues), and make the line-by-line change history less useful. This problem usually arises in codebases where these guidelines aren't adhered to (or enforced), especially when editor/IDE auto-format features are turned on.

**If in doubt, look at the existing code.** Existing code in the project will illustrate established conventions.

**Avoid personal trademarks.** It shouldn't be possible by reading the code to tell who wrote it. As far as formatting is concerned, this shouldn't be an issue if automated tools are set up with adequate rules.





----------------------------------------

## Dependencies

**Consider if there's a real need to use a library/tool.** If the task at hand can be done with a few lines of straightforward code, it may not be worth adding a new dependency. Be familiar with the latest platform/SDK and already-present libraries - what you need may already be available.

**Choose libraries/tools carefully.** Consider factors including quality, popularity, documentation, "aliveness", deprecation, and strength of community. Review alternatives. Depending on the nature of a library, its use may be localised in an area of a project - or widespread and intertwined with application code. The latter ones require particular care.

**Internal company libraries/tools/frameworks don't get a free pass.** These are just as susceptible to issues as open-source ones (perhaps even more so). They may for example be of poor quality, undocumented, or abandoned. Internal libraries rarely have a community, and aren't subject to consumer-selection like open-source ones are.

**Ensure the licence is compatible with our usage.** Some licences are not compatible with typical commercial usage. The [Choose a Licence website](https://choosealicense.com/licenses/) has a convenient summary of the most popular licences.

**Use the latest non-beta versions, generally.** These should be stable, include the latest features and bug fixes, likely to receive bug fixes, and have readily-accessible documentation. Newly-released major versions of dependencies that interact closely with others, or have a plugin ecosystem, may be worth deferring until the surrounding landscape catches up and settles down.

**Check that libraries don't bloat your built artefact.** This applies if your application is delivered to users over the internet - on the web, or as a mobile app. Use [tools](https://github.com/webpack-contrib/webpack-bundle-analyzer) from the ecosystem to analyse built artefacts.

**Follow established patterns and idioms for a given dependency.** Major libraries, frameworks and tools most often have an established way of using them effectively. This may be a combination of official and community-driven. Familiarising yourself with it will help you get the most out of them and avoid antipatterns. Read more than just the getting-started page.

**Avoid reimplementing library/framework features due to ignorance.** Try to be familiar with the "headline features" of what's already available. It's impossible to know everything and keep up to date, so you may find the following rules of thumb to quickly consider if something's likely to already be available: 1) Am I likely to be the first ever person using library-X that needed this feature? 2) If I was writing my own library-X, would I include this feature?





----------------------------------------

## Tech: CSS


### General

**CSS is code, too.** The items from the other topics in this guide apply. It requires code review, and is subject to automated and manual quality checks and rules - just like any other application code. Poor CSS is difficult to modify and extend, and can make it difficult to change or refactor the application.

**Keep CSS close to the component code that it styles.** Read: [files](#files).

**Resolve design inconsistencies.** UI designs are sometimes inconsistent in their styling, for example spacings or colours. Avoid carrying these over to the application's style code; not only do inconsistencies detract from the product, but they also tend to drive poor CSS. Some inconsistencies are trivial, while others need discussion with designers.


### Rules

**Use semantic class names.** Describe the purpose of the rule (e.g. `product`), not the content of the rule (e.g. `redBackground`). There are however a small number of exceptions where presentational/utility classes can be useful.

**Put related rules close together in the file.** This makes it easier for maintainers to discover them, and thus more likely to take them into account when making modifications.

**One selector per line.** Multiple ones per line are detrimental to readability.

**Avoid tight coupling of selectors to DOM structure.** Doing so makes both styles and DOM hard to modify without breaking the other. Beware selectors that specify many classes (mirroring the DOM tree), or using the `>` child combinator.

**Put declarations in a thought-out order.** Rules containing declarations in a random (or by time-added) order are more difficult to read and quickly visualise mentally. They are also prone to multiple conflicting (i.e. accidentally overridden) declarations. A thought-out ordering where the most important declarations come first, and related declarations are grouped together, avoids these problems. Use a linter to enforce the ordering. Established and popular orderings (which linters will have presets for) include [Concentric](http://rhodesmill.org/brandon/2011/concentric-css/), [RECESS](http://twitter.github.io/recess/), and [SMACSS](https://smacss.com/book/formatting#grouping).

**Use variables for standard colours, spacings, etc.** Doing so avoids repetition, and helps ensure consistency.


### Features and techniques

**Avoid fixed dimensions where not appropriate.** Fixed dimensions unhitch elements from the browser's sizing capabilities, resulting in a layout that doesn't adapt to browser size, and one that requires manual adjustments when the content is changed. They are not often necessary with modern layout features.

**Avoid absolute positioning where not appropriate.** Absolute positioning takes elements out of the layout flow by positioning them at particular coordinates. These require manual adjustment to fit surrounding elements together, and tend to proliferate by necessity once introduced into a layout. They are not often necessary with modern layout features.

**Avoid using floats to position elements.** The purpose of floats is to allow content to flow around an element. They were however historically used in ways they weren't designed for, to achieve layouts that weren't otherwise possible in CSS at the time. Modern layout features such are flexbox are much better alternatives, so it's rarely necessary or appropriate to use floats nowadays.

**Avoid using `text-align` to align elements.** This is an inherited property, so children of an element that is aligned using it, must counteract the unwanted text alignment by setting their own `text-align`. Use flexbox to align elements instead.

**Avoid using `!important`.** Adding this to a declaration to force-win a selector specificity contest should be avoided. It breaks out of the normal rules of specificity (being at the declaration level), and cannot be overridden without using yet another `!important` - tending to result in proliferation of its use.

**Use margin or padding as appropriate for the situation.** Margin creates space around an element; use it to separate an element from other elements. Adjacent vertical ones collapse. Padding creates space within an element (between the border and the content); use it to separate the contents of an element from its edges. Think about what you need to achieve, and think again if you find yourself needing to repeat yourself to maintain consistent desired spacings.

**Avoid using outdated techniques.** Advancements in CSS capabilities continue to bring about newer and better alternatives to many legacy techniques, and there is widespread support for them in browsers. Use them. With the advent of flexbox in particular, many hacks and workarounds are no longer necessary.

**Beware feature support in different browsers.** Either only use those supported by all browsers your application supports, or do progressive enhancement. Refer to the  [Can I use](https://caniuse.com/) reference, and browser compatibility tables on [MDN documentation pages](https://developer.mozilla.org/en-US/docs/Web/CSS/flex#Browser_compatibility). Use a [linter](https://github.com/anandthakker/doiuse) to automate compatibility checks.


### Isolation

**Namespace selectors to avoid unintentionally affecting unwanted elements.** Class names and selectors are defined and operate in a global space (the page), so a strategy is necessary to consistently and easily avoid rules that affect unwanted elements. Examples include using a component's root class as a prefix all its style rules' selectors, BEM, and CSS Modules. Even with such a strategy, particular care is required to avoid parent components unintentionally affecting other components nested within them.

**Avoid "reaching in" to subcomponents to add/override their styling.** Such styles are coupled to the child component's internal implementation (DOM and own styles), and are unlikely to be taken into consideration if that changes - making them fragile and hard to maintain. This is akin to using/modifying private state in object oriented programming. Instead, have the subcomponent support "option/mode classes" on its root, that parent components can apply to opt-in.

**Make components unopinionated about where/how they're used.** Styles affecting the outsides of a component's element, such as positioning/layout/spacing, should be left to be specified by the parent code that's using the component.

*For more on writing scalable CSS, I recommend this ["8 simple rules for a robust, scalable CSS architecture"](https://github.com/jareware/css-architecture) guide by Jarno Rantanen.*


### Comments

**Document browser bug workarounds.** Doing so highlights and explains unusual or confusing styles, for the benefit of your future self and others. For well-known issues, this can be done concisely with a short phrase and a link to e.g. [flexbugs](https://github.com/philipwalton/flexbugs#flexbug-1).

**Explain the choice of non-obvious "magic values" such as widths and spacings.** Documenting these allows future changes to be made with greater confidence, and avoid regressions. Widths chosen to fit particular longest-expected values are an example.

*Also see: [Comments](#comments)*





----------------------------------------

## Tech: HTML

**Avoid using the `id` attribute, generally.** It's not valid to use the same id value multiple times on a page. In an application composed of multiple components, some having multiple instances, it's easy to violate that requirement. The attribute is however useful for links that scroll to specific locations on the page.

**Use semantic markup.** There are many elements other than `<div>` and `<span>`, which convey meaning. Use them where appropriate, for example: headings, sections, forms, and paragraphs.

**Avoid using classes for anything other than CSS.** Selectors using classes are often used to programmatically select particular elements, for example in JavaScript code or integration tests. When modifying markup and CSS, it's easy to forget these less-visible usages - leading to breakages. Use dedicated custom attributes (e.g. `data-id`, `test-id`) instead.

**Keep complex code/expressions out of HTML templates.** Templates often need to rely on such things for conditional rendering and binding of data. Mixing complex ones with the HTML template makes both themselves and the markup more difficult to follow. Extract variables and/or methods for them instead.





----------------------------------------

## Tech: Java

*This is rather a short topic, as I worked mainly with other technologies while I gathered notes for this guide (2018).*

*I consider [Effective Java](https://www.goodreads.com/book/show/34927404-effective-java) mandatory reading for any Java developer, and also highly recommend [Java Concurrency in Practice](https://www.goodreads.com/book/show/127932.Java_Concurrency_in_Practice) and [Java 8 in Action](https://www.goodreads.com/book/show/20534354-java-8-in-action).*

----

**Use `==` and `.equals()` as appropriate.** Use the latter when required, but not when the former is all that's needed.

**Avoid unnecessary use of boxed primitive types.** True primitive types are simpler, avoid auto-(un)boxing mistakes, and cannot be `null`.

**Use `valueOf` to obtain BigDecimal constants.** The `double`-accepting constructor will construct one that accurately reflects the value given, such that `new BigDecimal(0.1)` does not have the value 0.1.

**Bear scale in mind when comparing BigDecimal equality.** The `equals()` method considers scale, while `compareTo()` does not. 1 is only equal to 1.0 when using the latter.

**Minimise visibility.** Not everything needs to be public: prefer default visibility where private is too restrictive. While member variable visibility is often thought of and minimised, classes and their methods are often left unnecessarily public - possibly due to IDE defaults.

**Use exception hierarchies.** This allows callers that care to handle a particular precise sub-exception, while allowing callers that don't to conveniently catch the one at the root of the hierarchy.





----------------------------------------

## Tech: JavaScript

**Avoid relying on the difference between `null` and `undefined`.** Doing so tends to cause fragile code. Use non-coercing equality (`==`) against `null` in equality checks for either of them. Avoid using both to signify a different kind of "no value" situation, such as "unknown field" vs. "no value for today".

**Beware the zero case with truthy/falsy checks.** If a number is present, it often needs to be treated the same way as any other number - not the same way as other falsy values.

**Floating point arithmetic, with its usual pitfalls.** Consider doing as little as possible on the client side, and/or using a [number library for JavaScript](https://github.com/MikeMcl/big.js/wiki).

**Beware feature support in different browsers.** Either only use those supported by all browsers the application supports, or do progressive enhancement. Refer to the [Can I use](https://caniuse.com/) reference, browser compatibility tables on [MDN documentation pages](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise#Browser_compatibility), and the [ECMAScript compatibility tables](https://kangax.github.io/compat-table/es6/). Use a [linter plugin](https://github.com/amilajack/eslint-plugin-compat) to automate compatibility checks. Some features may be transpiled by your build setup, or polyfilled - making them available in older browsers.

**Avoid using `setTimeout()` or similar in a fragile or ununderstood way.** Scenarios do come up that may be tempting to implement/fix by running a piece of code after a carefully chosen (usually by trial and error) time delay. The reason for such approaches working (at least some of the time) is rarely known to the author, and lead to fragile and unpredictable behaviour - especially when the delay is non-zero.

**Beware instance methods that mutate when it might not be expected.** These include Array's in-place `reverse()`, and many Moment.js methods (seriously consider an alternative such as date-fns or Luxon).

**Array `sort()` converts elements to strings and sorts them alphabetically by default.** For anything but strings, this is unlikely what's wanted - a comparator function must be given.

**String `replace()` only replaces the first occurrence when using a string as the pattern.** Global replace requires a regular expression to be used.

**Avoid duck type checks wherever possible.** They are easily broken if changes are made to the duck, and do not convey intention well.

**Avoid causing layout thrashing through interleaved reads and writes.** Group reads and writes to [properties that cause layout/reflow](https://gist.github.com/paulirish/5d52fb081b3570c81e3a) as much as possible.

**Avoid excessive work in response to user input.** This includes computation, screen updates, and requests to the server. Consider debouncing or throttling keyboard input and some types of mouse events.

**Avoid using outdated techniques.** Language advancements continue to bring about newer and better alternatives to many legacy techniques. Use them. Examples include async/await, and template strings.





----------------------------------------

## Comments

**Avoid pointless comments which don't add any value.** If something is clear from reading the code, a comment only adds noise.

**Consider whether the code could be improved such that the comment would no longer be necessary.** Comments which explain what the code is doing, and sometimes why, can often be rendered unnecessary through improving naming, refactoring (e.g. extracting a function), or introducing explanatory variables.

**Consider whether a unit test would be better communication.** Well-constructed and named unit tests can explain the reasoning behind the code, as well as demonstrating and verifying its behaviour in different cases.

**Explain reasoning when it's not clear from the code.** Anticipate what may leave future maintainers puzzled about the code. Examples include edge case handling, constraints that have to be worked around, and performance optimisations.

**Draw attention to the surprising and "gotchas".** If something is unintuitive or caught you out, it may be worth noting to help others. Examples include seemingly illogical business "logic", and surprising library code behaviour.

**Explain the choice of particular "magic values".** These include framework/server settings, timeouts, limits, batch/pool sizes, priorities, cache configuration, and orderings. We're familiar with extracting such values from our code into constants or configuration, but the reasons behind choosing the actual value is often left out. In some cases, this is after spending significant effort on activities such as load testing in order to choose appropriate values. Documenting these allows future changes to be made with greater confidence.

**Highlight bug workarounds, linking to an issue report.** This allows them to be easily identified and removed at a later date when the underlying bug (e.g. in a library) has been fixed. See [bug fixes](#bug-fixes).

**Document relationships between distant and disconnected parts of the code.** It's quite rare that these can't be made explicit through code. They are often things that are a certain way because something else far away (could even be in a downstream system) is a certain way - such as dependencies, or matching behaviours. Changing one could break the other in a surprising way, or introduce inconsistency in the user experience.

Write **clearly, concisely, and unambiguously.** Comments which follow these principles are quicker and easier to understand, and help avoid misinterpretation or confusion. The process of writing can often trigger ideas or solutions to problems, in much the same way as merely explaining a problem to someone can help you come up with a solution. Refactoring isn't only for code; after writing a comment, read it and consider if it could be improved.

Ensure that comments are **in sync and correct with respect to the current version of the code.** Outdated or no longer applicable comments can cause confusion.

Follow the project's **strategy for managing TODO comments.** Buildup of such comments in the code often indicates buildup of technical debt and necessary work. These tasks remain invisible to project feature/bug work tracking, leaving them in danger of being overlooked and forgotten - with various consequences. One such strategy is to require all TODOs to reference an issue tracker ticket before a pull request can be merged.





----------------------------------------

## Commits


### Content

**One logical piece of work per commit.** Separate each feature, bug and refactoring from other ones. This makes for a more useful history, and also encourages an organised approach to carrying out work. If you need to fix a bug while working on a feature, consider temporarily putting away your feature changes using a source control feature such as [Git's stash](https://git-scm.com/docs/git-stash).

**Prefer smaller, more regular commits.** Overly large commits are harder to understand and review effectively. Commit larger pieces of work incrementally as you reach small milestones.

**Separate out refactoring where possible.** Refactoring tends to be harder (and so less effective) to review, often including many moves and edits of existing code. Mixing it up with feature/bug work in a commit makes it harder still. When a task starts with some up-front non-trivial refactoring, consider making a separate, earlier pull request to get the changes to the main branch earlier. This helps avoid conflicts with other contributors' ongoing work.

**Remove existing code rendered unused by your changes.** The code immediately being removed may have been the only user of other parts of the code. The now-unused code could be in the same file, elsewhere in the codebase, or all the way down the stack from the UI to the database.

**Address or remove relevant existing and new TODO comments.** Existing ones may refer to the now-completed work. New ones may be temporary and require removal, or refer to issue tracker tickets for later work.

**Avoid including unrelated and unexplained changes.** An extension of the first item. Such changes are often [formatting](#formatting) issues, or mistakes made while resolving merge/rebase conflicts.

**Avoid including left-over unused code.** Such code is often from experimentation, trying different approaches, or trial-and-error. It may not be having an effect, or even running at all. CSS in particular tends to be quite susceptible to this.

**Avoid accidentally including unwanted files such as personal configuration and log files.** Use your source control tool's [ignore-file feature](https://git-scm.com/docs/gitignore) to prevent accidentally including such files. Check in the ignore file. Configuration that needs to be consistent across the team should however be checked in.


### Messages

**Summarise the change in the first ~70 characters.** This allows an at-a-glance understanding when reading the log. Many source control tools hide the rest of the message by default.

**Include the "why" as well as the "what".** Explain briefly what's being done. This is in the context of the commit - it needs to be more granular than just the headline name of a big feature. Bear in mind that the detail of the "what" can be found in the diff. The "why" however isn't always apparent or immediately clear, so do include it in the message. For more complex changes or refactorings, a brief description of the "what" can be helpful.

**Reference relevant issue tracker IDs, as per project conventions.** These identifiers allow further information around a change to be found conveniently. Most commonly, it's for the issue currently being worked on, but could also be other useful and relevant issues. The former case can be automated using a source control branch-detecting commit message hook, such as [this one](https://github.com/robatwilliams/git-ticket-number-prefix-hook).

*For more on why good commit messages matter, I recommend the introduction section in particular of this ["How to Write a Git Commit Message"](https://chris.beams.io/posts/git-commit/) article by Chris Beams.*


### Committing

**Preserve line history.** Source control tools can display a line-by-line view of the last change made to each line (often called "annotate" or "blame"). Committing changes and then making later commits to change the code back to how it was, makes this feature less useful. Editing such commits, or combining ("squashing") groups of commits where there has been significant churn, can help in such situations.

**Look at what's being committed.** It's all too easy to add all changes present in your working folder, ready for a quick commit. Adding each file individually however, quickly reviewing and the changes in each one as you go, gives you an opportunity to notice anything that's amiss.





----------------------------------------

## Pull request

*Pull request and code review process is highly specific to individual team circumstances and preferences. The points here inevitably reflect my experiences, but many of them should be general/adaptable enough to be relevant for other teams. Do what works for your team to get the most benefit out of time spent by authors and reviewers.*

*To read more about pull requests and code review - including culture, conduct, practices, and tools - start with [the code review awesome list](https://github.com/joho/awesome-code-review).*

----


### General

**Strive for small pull requests.** Large pull requests are harder to review, resulting in poorer feedback, unnoticed problems, "speed reviewing", and slow progress towards approval. If you're unable to split up work items for large features (due to process or politics), consider an incremental technique involving a series of smaller (e.g. 200-400 line) pull requests into a "collector branch" culminating in a single big pull request from that branch to the master/trunk.

**Strive for short-lived pull requests.** Any in-progress or in-review work on a branch is not yet part of the master/trunk that others are basing their work on. That can lead to conflicts which are time-consuming and error-prone to resolve. Being open for a long time increases the likelihood that a pull request will be open for an even longer time - as it requires updates after other pull requests are merged ahead of it (possibly involving conflict resolution). Consider setting some general and "SLA-type" ground rules to promote short-lived PRs, for example: review within *n* hours of being submitted, and review PRs or address feedback before starting new work. Making small pull requests helps keep them short-lived.

**Automate the tedious things.** Configure the build to require passing code style and static analysis checks. Such issues are quicker, cheaper, and more consistently detected by tooling than people.

**Set expectations up-front.** Make it easy for contributors to submit pull requests that will be approved first time, or at least without requiring major changes. Things that help with this include clear requirements, common understanding of application architecture and programming patterns/practices, and sharing design ideas before implementation starts.


### Before submitting

**The build succeeds.** This includes running tests and automated code quality checks.

**The branch is up to date with the target branch.** This is the only way of ensuring that the changes to be merged are compatible and integrated with the latest version of the target branch. This is done by merging the target branch into the source branch (or rebasing target on source).

**Self-review the code.** Read the requirements, and review your own code. This is an opportunity to spot any issues or things that were missed, and fix them immediately - increasing the likelihood of first-time approval.

**Complete the pre-submit checklist.** Checklists help everyone remember things that need to be done. What needs to be on the pre-submission checklist depends on the team and project, and should evolve over time - for example, what things are always coming up as feedback. To avoid diluting its importance, it shouldn't be too long or include trivial things. If the repository supports [templates for pull request descriptions](https://help.github.com/articles/creating-a-pull-request-template-for-your-repository/), create one containing the checklist - otherwise, a bookmarklet to quickly populate the pull request description field can help.

**Update the issue tracker ticket (if applicable).** If there have been clarifications, corrections, or amendments to the requirement made through other channels (email, IM, in-person), document these. This helps ensure that everyone (reviewers, testers, product owner) are using the correct information as the feature/fix makes its way towards being released.

**Add "insider insights/advice" for testers.** This is any useful information you feel that would help them, from your experience in implementing/fixing the requirement/bug - things that can't be known without reviewing the code changes. Add it to the issue tracker ticket. Examples include: things that were tricky to implement, seemingly unrelated areas/features that are affected (e.g. if a common component was modified), and scope of refactoring changes or technical tasks.


### Submitting

**Provide an informative title.** It's helpful to be able to quickly identify a pull request among many that are open on the repository. This isn't possible when the issue tracker id alone is used as a title.

**Provide information to help reviewers try out the change.** Examples include location of suitable test data, specific user type/configuration required, and service endpoint details. Add relevant parts of this to the issue tracker ticket as well.

**Add comments with time-saving hints.** Think as a reviewer, and add comments that'll help them make good use of their time. For example, point out code that has simply been moved, explain a noisy area of diff where there's little actual change, or explain an area that's likely to prompt requests for explanation.

**Draw attention to areas of code that require attention.** Avoid relying on reviewers picking up on things (or hoping that they don't). Having done the work, it's likely that you understand it in a deeper way than reviewers. Comment on things that don't feel quite right (new or existing), things you're unsure about (requirements or technical), or decisions of interest that you've made.


### Reviewing and giving feedback

**Review the entire change.** Everything in the codebase contributes directly or indirectly to the features and quality of the application. Avoid considering certain areas less worthy of review, and skipping them - for example tests, build configuration, or stylesheets.

**Run the code.** Just because it looks ok, doesn't mean that it does the right thing. If the project tooling makes it difficult for people to switch between their own work and running review branches, fix that.

**Look out for... everything, really.** Draw on your experience, knowledge, guides, and anything else. Does it do the right thing, does it make sense, is it good, is it maintainable, is it tested, are the assumptions/interpretations made clear and valid, etc.

**Ask questions.** Code review helps share knowledge of the codebase among the team, and helps contributors learn from each other. If something isn't clear or isn't understood, ask about it. If the entire change is hard to review and difficult to grasp, it may need improvement.

**Make clear comments, explaining reasoning where not obvious.** The immediate benefits include avoiding requests for clarification (which delay progress), and avoiding unexpected revisions made due to misinterpreted comments. The longer term benefit is the levelling-up of other participants as authors and reviewers. That helps improve overall quality, as it's usually impractical for a single person to review all changes.

**Look for missing pieces of the jigsaw.** The current code, plus the changes under review, plus other backlog work items - will at some point make up a releasable version of the software. Point out anything you think is missing but required - a backlog work item may need to be created for it.


### Addressing feedback

**Address all instances that a comment applies to.** Reviewers may not have noticed all places where a comment applies, or refrained from commenting on all of them to avoid causing noise (a good practice). Consider if the point made by a comment applies in other places beyond the specific line it was made on.

**Make it easy for reviewers to review revisions.** Depending on the repository/tooling in use, editing existing commits can make it difficult to see what was changed. Fine-grained commits that address individual comments (or logical groups thereof) are convenient to review and correlate to the original comments - allowing reviewers to see what changes were made in response to their feedback. They also create better version control history. Single wide-ranging commits entitled along the lines of "address pr comments" have none of these benefits.

**Minimise repeated back-and-forth.** Some things are easier to resolve with a conversation, rather than repeated cycles of changes and comments, or long-running comment thread discussions. When you spot one of these back-and-forth/churn situations, have a conversation or suggest a short pair-programming session.


### Before merging

**The build succeeds.** Configure tooling (repository and CI server) to require a successful build of the latest version of the branch before merging is allowed.

**The branch is up to date with the target branch.** Configure the repository to require that the source branch not be behind target before merging is allowed.

**All comments have been resolved.** This normally means making revisions, answering a reviewer's question (to their satisfaction), or concluding a discussion. It can be difficult to track outstanding comments - repository features such as reactions (thumbs-up etc.) or task checkboxes can help. Configure the repository (if supported) to require that all tasks are completed before merging is allowed.

**All checklist items are checked.** A pull request checklist may include pre-merge items in addition to pre-submit ones.

**Adequate approval has been given by reviewers.** What's adequate depends on the team and project. A minimum number of approvals is usually required. It may be necessary to further require one/few approvals from a group of people deemed responsible enough. Configure the repository (to whatever extent supported) to require these approvals before merging is allowed. Further, use good judgement to decide if approval should be sought from particular people such as area/domain/technology specialists.

**Approvals still stand, if post-approval changes were made.** Significant revisions can sometimes arise from feedback given by one reviewer after another reviewer has approved. In such cases, the reviewer who had already approved may wish to re-review. Repositories can be configured to revoke approvals when subsequent changes are made, but this tends to become tedious as merges-in or trivial changes trigger it.





----------------------------------------

## Features

**Ambiguities and questions have been resolved.** Document them with the requirement on the issue tracker.

The requirement **does not contradict or logically conflict with existing features.** Strive for a coherent user experience.

The implementation **meets the requirement**, taking clarifications and refinements into account. Read the requirement once again to make sure nothing was missed.

The implementation **doesn't introduce new unwanted behaviour.**

The implementation **meets the non-functional requirements**. If they aren't defined, make an effort to find out and help define adequate ones. Examples include response times, supported browsers and versions, and targeted devices/form factors.

The implementation **meets general application requirements and conventions** not explicitly mentioned on this piece of work or perhaps anywhere. Be familiar with existing functionality, and strive for consistency.

The implementation **does not add friction to the developer experience/workflow** that hampers productivity. There should be a straightforward way of disabling or a set-and-forget workaround for anything that does.

**Think ahead to future work.** We want to keep things simple and avoid building things we'll never need. We can however avoid making life hard for our future selves by being aware of upcoming and medium-term requirements, and bearing them in mind today.





----------------------------------------

## UI text

*These items apply to **all text regardless of who wrote it**; text provided by UX or business stakeholders should be reviewed and any issues resolved with the author.*

----

Be **accurate and unambiguous**.

**Avoid contradicting** other text or actual application behaviour. Existing text in other areas of the application may need to be updated.

Use **correct spelling and grammar**.

Use **consistent capitalisation** of terms.

Use **consistent style and tone**.

Use **correct tense (current/past).** This also applies to log messages.

Use **consistent terminology** when referring for example to application features and business concepts.

**Avoid relying on enum member order for UI display order.** Logical or alphabetical display order is often different from order of members in code. The order of members is also liable to change, without expectation of any side-effects.

Use **realistic and professional mock data**. Realistic data helps detect issues that could occur later using real data. Unprofessional or joke data can cause offence, or give a poor impression of the team - you never know who's going to see it and what frame of mind they're going to be in.





----------------------------------------

## Bug fixes

**Find the cause before attempting a fix.** Any fix based on first-glance analysis without knowing or understanding the cause is unlikely to be a good/correct one.

**Are there other occurrences of this bug or similar ones that need fixing?** They could be in similar functionality, or in code using similar techniques/patterns that could be prone to similar programming errors.

**Fix the root cause.** Fixing symptoms alone, or intermediate causes, is a workaround rather than a complete fix. They often involve adding code to work against something other code is doing.

**Understand why the fix works.** A fix which appears to work, but cannot be explained why, may be unreliable or incomplete.

**Add test(s) which don't pass without the fix.** Tests will help prevent regression - the bug being reintroduced through later changes. Choose unit and/or integration tests as appropriate. Validate the test by checking that it fails against the unfixed code.

**Describe the issue and underlying problem briefly in the commit message.** Doing so aids reviewers in understanding the fix, and contributes to useful history. Linked bug report tickets are unlikely to have adequate technical detail or analysis.

**Report bugs in open source libraries.** Getting them fixed at the source will allow us to later remove any workarounds we had to implement, and improves their quality for everyone. If one exists already, "+1" it and add any useful information for maintainers or other consumers (e.g. workarounds). Comment any workarounds in our code, including a link to the bug report. Subscribe to it, to be notified when it gets fixed.

**What can we do to avoid or automatically detect similar bugs in future?** There may be patterns we should use (or avoid), or knowledge we should share. There may be linter [rules](https://eslint.org/docs/rules/#possible-errors), [plugins](https://github.com/amilajack/eslint-plugin-compat), or [other](https://github.com/anandthakker/doiuse) tools we could use to automatically detect would-be issues at the earliest opportunity.





----------------------------------------

## Meta

Is there **anything to add** to this guide?

Could **detection of any issues that arose be automated?** Whether that was during the review, or while working/pre-review. Automation saves time and ensures consistency.
