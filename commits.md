# Commits


## Content

**One logical piece of work per commit.** Separate each feature, bug and refactoring from other ones. This makes for a more useful history, and also encourages an organised approach to carrying out work. If you need to fix a bug while working on a feature, consider temporarily putting away your feature changes using a source control feature such as [Git's stash](https://git-scm.com/docs/git-stash).

**Prefer smaller, more regular commits.** Overly large commits are harder to understand and review effectively. Commit larger pieces of work incrementally as you reach small milestones.

**Separate out refactoring where possible.** Refactoring tends to be harder (and so less effective) to review, often including many moves and edits of existing code. Mixing it up with feature/bug work in a commit makes it harder still. When a task starts with some up-front non-trivial refactoring, consider making a separate, earlier pull request to get the changes to the main branch earlier. This helps avoid conflicts with other contributors' ongoing work.

**Remove existing code rendered unused by your changes.** The code immediately being removed may have been the only user of other parts of the code. The now-unused code could be in the same file, elsewhere in the codebase, or all the way down the stack from the UI to the database.

**Address or remove relevant existing and new TODO comments.** Existing ones may refer to the now-completed work. New ones may be temporary and require removal, or refer to issue tracker tickets for later work.

**Avoid including unrelated and unexplained changes.** An extension of the first item. Such changes are often [formatting](formatting.md) issues, or mistakes made while resolving merge/rebase conflicts.

**Avoid including left-over unused code.** Such code is often from experimentation, trying different approaches, or trial-and-error. CSS tends to be quite susceptible to this.

**Avoid accidentally including unwanted files such as personal configuration and log files.** Use your source control tool's [ignore-file feature](https://git-scm.com/docs/gitignore) to prevent accidentally including such files. Check in the ignore file. Configuration that needs to be consistent across the team should however be checked in.
