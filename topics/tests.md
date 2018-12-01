# Tests


## General

**Tests are code, too.** The items from the other topics in this guide apply. They require code review, and are subject to the same automated and manual quality checks and rules as the main code. Poor test code is less reliable, and can make it difficult to change or refactor the main code.

**Keep test code close to the code they're testing.** Read: [files](files.md).

**Single focus and purpose per test.** Tests with wide scope are less clear, and make it harder to identify the cause of failures. Aim for failures only related to the case described in the test name, and make assertions as required.


## What to test

**Balance value against cost.** Tests require effort to write and maintain. Consider for a given piece of code (however small) if the confidence you gain in its correctness and avoidance of future breakages is worth it against how time consuming and difficult it is to test. This item is not an excuse for antipatterns that make code difficult to test.

**Coverage is a guide; it does not imply adequacy nor inadequacy.** Coverage indicates which paths through the code were taken while executing the tests. It doesn't say anything about good choice of test cases, or making appropriate assertions. Tests for code giving high coverage may need improvement, and tests for code giving lower coverage may be perfectly adequate. Avoid writing low-value tests to bump up the coverage metrics.

**Avoid tests that test that the code "does what it does".** Such tests typically check that certain mocks are called, and don't test any logic of the unit under test (if the unit even has any). They are brittle, an overhead for refactoring, noise, and low-value.

**Avoid tests that test the mocking library.** Usually accidental, such tests assert nothing about our code and instead for example check that the method stubbing feature works.

**Include tests for edge cases and unhappy paths.** We need to be confident that our code works in all cases, not just the "normal" ones which may occur the vast majority of the time. Examples include errors, timeouts, invalid data, no data, and boundary values.


## Structure and isolation

**Avoid shared state between tests.** Shared state breaks test isolation, usually leading to a mess involving false passes or false failures depending on which tests are run together and in which order. Examples include shared variables (usually to avoid redeclaration), re-used test instances, and re-used mocks. Always start afresh.

**Avoid shared setup logic in hooks.** This means block(s) of code that the test framework runs before a collection of individual tests. Taken to extreme, it involves nested groups of tests, with a shared setup block at each level. It encourages the use of shared state, allows accidental use of shared state, makes setup difficult to follow, makes tailoring setup for individual tests difficult, and makes it hard to modify tests and add new ones.

**Abstract common setup logic into utility functions.** This avoids pretty much all the issues that arise from using hooks. Extract shared setup logic into utility functions, and use them directly and as-needed from individual tests. The functions return objects ready for use in the test, and often accept parameters (data, or options) to allow tailoring the setup for individual tests. The latter makes it easy to see the difference in setup between each test.

**Avoid relying on the current system time and time zone.** Such tests don't test the same thing every time they're run, and are likely to cause issues in the future or when run by people or CI servers in different locations. Inject the current time into your code instead, allowing specific fixed times to be injected in tests.


## Assertions

**Use strict assertions.** These strengthen the test and make it more likely to detect future regressions. Examples include strict equality, and errors/exceptions of specific types with specific messages.

**Use the most appropriate assertions.** Test frameworks include assertions other than equality. They clarify the test code, and produce better failure messages.

**Ensure that assertions in asynchronous code are actually run.** Use test framework specific techniques to ensure they are run. Some frameworks provide synchronous [assertions](https://jestjs.io/docs/en/expect#expectassertionsnumber) that assert that later assertions are in fact made.


## Other

**Mock immediate dependencies rather than transitive ones.** This keeps the test independent and focused on the single unit.

**Avoid re-using mock runtime data as mock test data.** Such data is designed for a different purpose (demo, usually), and should remain modifiable without affecting the tests.

**Avoid waiting for elapsed clock time.** Tests that wait this way for asynchronous code and timers are slow to run; this becomes a big problem when you have hundreds of them. Instead, use your test framework's time-mocking facility which allows time to be advanced immediately.
