# Error handling


## General

**Throw exceptions in the domain of the method's interface.** This avoids breaching abstractions or application layers. For example, DAOs shouldn't throw HTTP exceptions, and neither should they propagate JDBC exceptions. Exceptions can be caught and wrapped in more appropriate ones to facilitate this.

**Either log exceptions, or throw them - not both, generally.** Thrown exceptions will be caught at some level; if the lower level thrower can't handle the exception then it's likely not best placed to decide that it should be logged, and to do so informatively with context. Widespread log-and-throw also leads to duplicate logging as an exception bubbles up the call hierarchy. An exception to the rule is when that higher level is outside our control (e.g. a framework) - and doesn't log, logs at an undesirable level, or doesn't include sufficient detail.


## Control flow

**Throw an exception from a method that can't do what its name promises.** The name [conveys expectations](https://www.hanselman.com/blog/IfYourMethodCantDoWhatItsNamePromisesItCanThrow.aspx), and the caller needs to be informed if they cannot be met.

**Avoid logging errors and continuing execution regardless.** Such practice is not meaningful error handling, and is likely to cause follow-on errors and damage. Execution in the current context should stop, or take some alternate recovery path.


## Information management and capture

**Include relevant and contextual information in exception/log messages.** Such information aids diagnosis of problems. Examples include problematic values, state, and identifiers. For custom exceptions, some of this information can be made mandatory in the constructor as opposed to the common practice of accepting a single string message.

**Consider catch-wrap-rethrow to add a more helpful message and/or contextual information.** The original thrower may not have had much context or data to construct a particularly useful message. Callers of such throwers can catch such exceptions and wrap them in more informative exceptions before throwing those further.

**Log caught exceptions in full, generally.** Logging only a generic message, or only the caught exception's message, discards potentially useful information - the messages of wrapped cause-exceptions, and the stack trace. At a system boundary (e.g. when exposing an API), it's usually desirable to omit (or log at a lower level) the detail of client errors (e.g. request validation) to avoid excessive log noise.


## Web APIs

**Respond with an appropriate error response code, and an informative body including further detail.** This allows clients to quickly identify the nature of the problem without needing to consult service logs. For example, a response may indicate a bad request together with an explanation of what was wrong with it.

**Avoid revealing (or making inferable) sensitive information or implementation details in error responses.** Sensitive information is anything the client shouldn't know about (even it it isn't shown in the UI they're using), such as the existence of data they don't have access to, or restrictions/limits that are in place on their account. Revealing implementation details could aid attackers, either of the application or others in the organisation. Many web frameworks have features and/or encouraged patterns for handling this issue centrally and consistently.


## User interface

**Show appropriate and helpful information to the user.** The main body should communicate in non-technical terms what the problem is, the current state of what the user was doing, and a path to rectifying the problem. Technical detail may be included in a revealable area for inclusion on bug reports.

**Only ask the user to try again if the problem is transient.** Trying again after a connection problem may well work. Trying again with the same invalid form input certainly won't.

*Also see: [UI text](ui-text.md)*
