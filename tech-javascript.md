# JavaScript

**Avoid relying on the difference between `null` and `undefined`.** Doing so tends to cause fragile code. Use non-coercing equality (`==`) against `null` in equality checks for either of them. Avoid using both to signify a different kind of "no value" situation, such as "unknown field" vs. "no value for today".

**Floating point arithmetic, with its usual pitfalls.** Consider doing as little as possible on the client side, and/or using a [number library for JavaScript](https://github.com/MikeMcl/big.js/wiki).

**Beware feature support in different browsers.** Either only use those supported by all browsers the application supports, or do progressive enhancement. Refer to the [Can I use](https://caniuse.com/) reference, browser compatibility tables on [MDN documentation pages](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise#Browser_compatibility), and the [ECMAScript compatibility tables](http://kangax.github.io/compat-table/es6/). Use a [linter plugin](https://github.com/amilajack/eslint-plugin-compat) to automate compatibility checks.  Some features may be transpiled by your build setup, or polyfilled - making them available in older browsers.

**Beware methods that mutate when it might not be expected.** These include Array's in-place `reverse()`, and many Moment.js methods (seriously consider an alternative such as date-fns or Luxon).

**Array `sort()` converts elements to strings and sorts them alphabetically by default.** For anything but strings, this is unlikely what's wanted - a comparator function must be given.

**String `replace()` only replaces the first occurrence when using a string as the pattern.** Global replace requires a regular expression to be used.

**Avoid causing layout thrashing through interleaved reads and writes.** Group reads and writes to [properties that cause layout/reflow](https://gist.github.com/paulirish/5d52fb081b3570c81e3a) as much as possible.

**Avoid excessive work in response to user input.** This includes computation, screen updates, and requests to the server. Consider debouncing or throttling keyboard input and some types of mouse events.

**Avoid using outdated techniques.** Language advancements continue to bring about newer and better alternatives to many legacy techniques. Use them.