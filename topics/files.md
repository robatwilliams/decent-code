# Files

**Named well and as per conventions.** Refer to [naming things](naming-things.md). Follow project conventions (e.g. suffixes) and casing style.

**In an appropriate folder.** Considerations include purpose and functional area.

**Organised by functional separation, rather than by file type.** This means by application functional area / module, or component - not by file type (e.g. controllers, styles, DAOs). Structuring this way keeps related code together, which aids discoverability and navigation.

**Test files are close to the code they're testing.** The standard Java convention of separate `src` and `test` folders is the opposite of this. Having them nearby makes them easier to find, keeps them in peoples' minds, and makes it easy to notice missing ones. Practically, this means putting them in a sibling folder to the files they're testing.
