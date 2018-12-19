# Java

*This is rather a short topic, as I worked mainly with other technologies while I gathered notes for this guide (2018).*

*I consider [Effective Java](https://www.goodreads.com/book/show/34927404-effective-java) mandatory reading for any Java developer, and also highly recommend [Java Concurrency in Practice](https://www.goodreads.com/book/show/127932.Java_Concurrency_in_Practice) and [Java 8 in Action](https://www.goodreads.com/book/show/20534354-java-8-in-action).*

----

**Use `==` and `.equals()` as appropriate.** Use the latter when required, but not when the former is all that's needed.

**Avoid unnecessary use of boxed primitive types.** True primitive types are simpler, avoid auto-(un)boxing mistakes, and cannot be `null`.

**Use `valueOf` to obtain BigDecimal constants.** The `double`-accepting constructor will construct one that accurately reflects the value given, such that `new BigDecimal(0.1)` does not have the value 0.1.

**Bear scale in mind when comparing BigDecimal equality.** The `equals()` method considers scale, while `compareTo()` does not. 1 is only equal to 1.0 when using the latter.

**Minimise visibility.** Not everything needs to be public: prefer default visibility where private is too restrictive. While member variable visibility is often thought of and minimised, classes and their methods are often left unnecessarily public - possibly due to IDE defaults.

**Use exception hierarchies.** This allows callers that care to handle a particular precise sub-exception, while allowing callers that don't to conveniently catch the one at the root of the hierarchy.
