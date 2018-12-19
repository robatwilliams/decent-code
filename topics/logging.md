# Logging


## General

**Bear in mind the purpose of logging.** The main ones are: determining if the application is running smoothly, and diagnosing what the problem is if it isn't running smoothly. Having these in mind helps when deciding if we should log, and if so, what information should be included. There should be some "tickover" `INFO` logging while the application is in use, to indicate that everything's fine. When things aren't fine, there should be `WARN` and `ERROR` logging to call attention to that, and detail what the problem is.

**Follow application conventions for when/what/how.** This ensures that all areas of the application log consistently.

**Avoid trivial, irrelevant, or duplicate logging.** Such logging is only noise, detracting from the "signal" of actually-important logging.

**Read logging output to ensure "flow".** It should read coherently, as a story of what's happening. Try reading it while exercising specific application tasks, and while a load test is underway.

**Avoid tightly coupled logging collaboration and dependencies.** Log messages should mostly be able to stand alone. They should remain meaningful if other distant log calls are modified or removed; that is, the complete log output should not be fragile. Avoid referring to, setting expectations of, building multi-message "sentences" in collaboration with, or relying on distant logging to "close off business you started".


## Content

Write **clear, concise, and unambiguous messages.** Messages which follow these principles are quicker and easier to understand, and help avoid misinterpretation or confusion.

**Include relevant and contextual information.** Such information aids diagnosis of problems. Examples include key values, state, and identifiers. For ease of searching and to allow parsing by log viewing tools, consider using a pattern such as `key=value | other=value`.

**Distinguish values from message text using delimiters.** Some types of data can be hard to distinguish from the log message template itself, when they are embedded within the message. Use delimiters such as quotes, braces, or angle brackets to clarify the boundaries where necessary.

**Use mapped diagnostic context (MDC) to distinguish logging from multiple threads.** It's almost impossible to gain an understanding of what's going on when logging output from multiple concurrent thread is interleaved. Including context information such as user/request IDs in individual log statements is tedious and repetitive. Instead, configure your logger's pattern to include such information on every line along with the timestamp.


## Levels

**Use levels appropriately and consistently.** Establish (or obtain) guidelines, and follow them. When the application is running smoothly for example, it shouldn't be spewing a deluge of errors and warnings.

**Client errors are not application errors.** If a client sends an invalid request or otherwise does something illegal/wrong, it's that client that's in the wrong - not the application handling the request. Logging such errors as application errors generates noise when a misbehaving or poorly-implemented client calls our application.


----

*Also see: [Error handling](error-handling.md)*

*Further reading:*
* *[The Art of Logging](https://www.codeproject.com/Articles/42354/The-Art-of-Logging), by Colin Eberhardt*
* *[Log Level Inflation](https://marxsoftware.blogspot.com/2010/09/log-level-inflation.html), by Dustin Marx*
* *[Verbose Logging Will Disturb Your Sleep](https://github.com/97-things/97-things-every-programmer-should-know/blob/master/en/thing_90/README.md), by Johannes Brodwall*
