# Tests


## General

**Tests are code, too.** The items from the other topics in this guide apply. They require code review, and are subject to the same automated and manual quality checks and rules as the main code. Poor test code is less reliable, and can make it difficult to change or refactor the main code.

**Keep test code close to the code they're testing.** Read: [files](files.md).

**Single focus and purpose per test.** Tests with wide scope are less clear, and make it harder to identify the cause of failures. Aim for failures only related to the case described in the test name, and make assertions as required.
