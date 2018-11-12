# Functional

**The feature works in all supported browsers.** This includes aspects off the main usage path for the feature. Internet Explorer in particular needs watching out for. See [Tech: JavaScript](tech-javascript.md) > feature support.

**The feature works in the "prod mode" build (if applicable).** Development modes, which are often used to improve the developer experience (productivity), make the running application less like what the production version will be. Testing while using such modes can result in undetected problems, and also typically reduces performance.

**Error cases are handled.** Depending on the nature of the error, this includes: detection, logging, recovery/abort, and notifying the user. See [error handling](error-handling.md).

**Fail fast, and fail proactively.** Detect problems at the earliest opportunity, and make them immediately and clearly visible (e.g. log, UI message, application abortion). Avoid allowing the application to continue into undefined states - hoping for the best. The "fast and proactive" strategy makes problems from many facets (e.g. code, configuration, infrastructure) easier to find and diagnose, findable sooner, and helps avoid collateral damage. For example, an application would fail at startup if a database/API connection cannot be established - rather than doing so the first time its API is called. Another example: an application would fail at startup if the configuration (or permutation of user permissions) is invalid - rather than doing so if/when a particular feature is used, falling back to a default value, or continuing execution anyway.

**Date, time, time zones, and summer/winter time transitions are handled correctly.** Understand the concepts of time, and have a consistent application-wide strategy for dealing with them. Use a library/SDK for manipulating time, and treat manual manipulation as a warning sign (it's with good reason that libraries don't support some operations: they don't make sense). Take care not to break the "opposite case" when fixing summer/winter time problems (or transition-related ones). Applications shouldn't usually include unit tests for libraries they use, but consider making an exception in this area for non-trivial cases - not to test the library, but to test that you're using it correctly.

**Requests/calls for data are well thought-out.** They are made at appropriate moments, not repeated unnecessarily, and don't return excessive volume beyond what the application needs (use paging/limits). Caching is used where appropriate, and disabled where not. Examples include requests to APIs, and database calls.

**Secondary UI states are handled.** These include: loading, error, no data, and too much data to show at once.
