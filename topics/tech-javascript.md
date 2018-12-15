# JavaScript

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
