# CSS


## General

**CSS is code, too.** The items from the other topics in this guide apply. It requires code review, and is subject to automated and manual quality checks and rules - just like any other application code. Poor CSS is difficult to modify and extend, and can make it difficult to change or refactor the application.

**Keep CSS close to the component code that it styles.** Read: [files](files.md).

**Resolve design inconsistencies.** UI designs are sometimes inconsistent in their styling, for example spacings or colours. Avoid carrying these over to the application's style code; not only do inconsistencies detract from the product, but they also tend to drive poor CSS. Some inconsistencies are trivial, while others need discussion with designers.


## Rules

**Use semantic class names.** Describe the purpose of the rule (e.g. `product`), not the content of the rule (e.g. `redBackground`). There are however a small number of exceptions where presentational/utility classes can be useful.

**Put related rules close together in the file.** This makes it easier for maintainers to discover them, and thus more likely to take them into account when making modifications.

**One selector per line.** Multiple ones per line are detrimental to readability.

**Put declarations in a thought-out order.** Rules containing declarations in a random (or by time-added) order are more difficult to read and mentally visualise. They are also prone to multiple conflicting (i.e. accidentally overridden) declarations. A thought-out ordering where the most important declarations come first, and related declarations are grouped together, avoids these problems. Use a linter to enforce the ordering. Established and popular orderings (which linters will have presets for) include [Concentric](http://rhodesmill.org/brandon/2011/concentric-css/), [RECESS](http://twitter.github.io/recess/), and [SMACSS](https://smacss.com/book/formatting#grouping).
