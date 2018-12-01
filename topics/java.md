# Java

*This is rather a short topic, as I worked mainly with other technologies while I gathered notes for this guide (2018).*

*I consider [Effective Java](https://www.amazon.co.uk/Effective-Java-Joshua-Bloch/dp/0134685997) mandatory reading for any Java developer, and also highly recommend [Java Concurrency in Practice](https://www.amazon.co.uk/Java-Concurrency-Practice-Brian-Goetz) and [Java 8 in Action](https://www.amazon.co.uk/Java-Action-Lambdas-functional-style-programming/dp/1617291994/).*

----

**Use `==` and `.equals()` as appropriate.** Use the latter when required, but not when the former is all that's needed.

**Avoid unnecessary use of boxed primitive types.** True primitive types are simpler, avoid auto-(un)boxing mistakes, and cannot be `null`.

**Use `valueOf` to obtain BigDecimal constants.** The `double`-accepting constructor will construct one that accurately reflects the value given, such that `new BigDecimal(0.1)` does not have the value 0.1.

**Bear scale in mind when comparing BigDecimal equality.** The `equals()` method considers scale, while `compareTo()` does not. 1 is only equal to 1.0 when using the latter.

**Minimise visibility.** Not everything needs to be public: prefer default visibility where private is too restrictive. While member variable visibility is often thought of and minimised, classes and their methods are often left unnecessarily public - possibly due to IDE defaults.

**Use exception hierarchies.** This allows callers that care to handle a particular precise sub-exception, while allowing callers that don't to conveniently catch the one at the root of the hierarchy.

