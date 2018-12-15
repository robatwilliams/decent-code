# Code fashion

*"Fashion" here refers to non-stylistic approaches/techniques, and is chosen to distinguish it from [formatting](formatting.md).*

----

## Logic

**Base logic on identifiers, not names.** Names are generally not guaranteed to be unique, and are prone to change. Identify things using their identifiers to drive logic.

**Avoid reversing conditionals through negating the expression.** Handling the `false` case in the else block makes the construct easier to follow, especially when there are multiple `else if` cases.
