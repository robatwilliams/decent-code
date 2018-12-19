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
1. [Naming things](topics/naming-things.md)
1. [Code flow](topics/code-flow.md)
1. [Code structure](topics/code-structure.md)
1. [General programming](topics/general-programming.md)
1. [Functional](topics/functional.md)
1. [Error handling](topics/error-handling.md)
1. [Logging](topics/logging.md)
1. [Tests](topics/tests.md)
1. [Files](topics/files.md)
1. [Formatting](topics/formatting.md)
1. [Dependencies](topics/dependencies.md)
1. Tech specifics
   1. [CSS](topics/tech-css.md)
   1. [HTML](topics/tech-html.md)
   1. [Java](topics/tech-java.md)
   1. [JavaScript](topics/tech-javascript.md)
1. [Comments](topics/comments.md)
1. [Commits](topics/commits.md)
1. [Pull request](topics/pull-request.md)
1. [Features](topics/features.md)
1. [UI text](topics/ui-text.md)
1. [Bug fixes](topics/bug-fixes.md)
1. [Meta](topics/meta.md)


## Further reading
The following books on generally writing good code are popular and highly-rated.

* [97 Things Every Programmer Should Know](https://www.goodreads.com/book/show/7003902-97-things-every-programmer-should-know) *(free to [read online](https://github.com/97-things/97-things-every-programmer-should-know)*)
* [Clean Code](https://www.goodreads.com/book/show/3735293-clean-code)
* [Code Complete](https://www.goodreads.com/book/show/4845.Code_Complete)
