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


## Features and techniques

**Avoid fixed dimensions where not appropriate.** Fixed dimensions unhitch elements from the browser's sizing capabilities, resulting in a layout that doesn't adapt to browser size, and one that requires manual adjustments when the content is changed. They are not often necessary with modern layout features.

**Avoid absolute positioning where not appropriate.** Absolute positioning takes elements out of the layout flow by positioning them at particular coordinates. These require manual adjustment to fit surrounding elements together, and tend to proliferate by necessity once introduced into a layout. They are not often necessary with modern layout features.

**Avoid using floats to position elements.** The purpose of floats is to allow content to flow around an element. They were however historically used in ways they weren't designed for, to achieve layouts that weren't otherwise possible in CSS. Modern layout features such are flexbox are much better alternatives, so it's rarely necessary or appropriate to use floats nowadays.

**Avoid using `text-align` to align elements.** This is an inherited property, so children of an element that is aligned using it, must counteract the unwanted text alignment by setting their own `text-align`. Use flexbox to align elements instead.

**Avoid using `!important`.** Adding this to a declaration to force-win a selector specificity contest should be avoided. It breaks out of the normal rules of specificity (being at the declaration level), and cannot be overridden without using yet another `!important` - tending to result in proliferation of its use.

**Use margin or padding as appropriate for the situation.** Margin creates space around an element; use it to separate an element from other elements. Adjacent vertical ones collapse. Padding creates space within an element (between the border and the content); use it to separate the contents of an element from its edges. Think about what you need to achieve, and think again if you find yourself needing to repeat yourself to maintain consistent desired spacings.

**Avoid using outdated techniques.** Advancements in CSS capabilities continue to bring about newer and better alternatives to many legacy techniques, and there is widespread support for them in browsers. Use them. With the advent of flexbox in particular, many hacks and workarounds are no longer necessary.

**Beware feature support in different browsers.** Either only use those supported by all browsers your application supports, or do progressive enhancement. Refer to the  [Can I use](https://caniuse.com/) reference, and browser compatibility tables on [MDN documentation pages](https://developer.mozilla.org/en-US/docs/Web/CSS/flex#Browser_compatibility). Use a [linter](https://github.com/anandthakker/doiuse) to automate compatibility checks.


## Isolation

**Namespace selectors to avoid unintentionally affecting unwanted elements.** Class names and selectors are defined and operate in a global space (the page), so a strategy is necessary to consistently and easily avoid rules that affect unwanted elements. Examples include using a component's root class as a prefix all its style rules' selectors, BEM, and CSS Modules. Even with such a strategy, particular care is required to avoid parent components unintentionally affecting other components nested within them.

**Avoid "reaching in" to subcomponents to add/override their styling.** Such styles are coupled to the child component's internal implementation (DOM and own styles), and are unlikely to be taken into consideration if that changes - making them fragile and hard to maintain. This is akin to using/modifying private object state in OO programming. Instead, have the subcomponent support "option/mode classes" on its root - that parent components can opt-in to using.

**Make components unopinionated about where/how they're used.** Styles affecting the outsides of a component's elements, such as positioning/layout/spacing, should be left to be specified by the parent code that's using the component.


## Comments

**Document browser bug workarounds.** Doing so highlights and explains unusual or confusing styles, for the benefit of your future self and others. For well-known issues, this can be done concisely with a short phrase and a link to e.g. [flexbugs](https://github.com/philipwalton/flexbugs#flexbug-1).

**Explain the choice of non-obvious "magic values" such as widths and spacings.** Documenting these allows future changes to be made with greater confidence, and avoid regressions. Widths chosen to fit particular longest-expected values are an example.

*Also see: [Comments](comments.md)*
