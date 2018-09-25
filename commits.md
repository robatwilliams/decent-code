# Commits


## Content

**One logical piece of work per commit.** Separate each feature, bug and refactoring from other ones. This makes for a more useful history, and also encourages an organised approach to carrying out work. If you need to fix a bug while working on a feature, consider temporarily putting away your feature changes using a source control feature such as [Git's stash](https://git-scm.com/docs/git-stash).

**Prefer smaller, more regular commits.** Overly large commits are harder to understand and review effectively. Commit larger pieces of work incrementally as you reach small milestones.

**Separate out refactoring where possible.** Refactoring tends to be harder (and so less effective) to review, often including many moves and edits of existing code. Mixing it up with feature/bug work in a commit makes it harder still. When a task starts with some up-front non-trivial refactoring, consider making a separate, earlier pull request to get the changes to the main branch earlier. This helps avoid conflicts with other contributors' ongoing work.

**Remove existing code rendered unused by your changes.** The code immediately being removed may have been the only user of other parts of the code. The now-unused code could be in the same file, elsewhere in the codebase, or all the way down the stack from the UI to the database.

**Address or remove relevant existing and new TODO comments.** Existing ones may refer to the now-completed work. New ones may be temporary and require removal, or refer to issue tracker tickets for later work.

**Avoid including unrelated and unexplained changes.** An extension of the first item. Such changes are often [formatting](formatting.md) issues, or mistakes made while resolving merge/rebase conflicts.

**Avoid including left-over unused code.** Such code is often from experimentation, trying different approaches, or trial-and-error. CSS in particular tends to be quite susceptible to this.

**Avoid accidentally including unwanted files such as personal configuration and log files.** Use your source control tool's [ignore-file feature](https://git-scm.com/docs/gitignore) to prevent accidentally including such files. Check in the ignore file. Configuration that needs to be consistent across the team should however be checked in.


## Messages

**Summarise the change in the first ~70 characters.** This allows an at-a-glance understanding when reading the log. Many source control tools hide the rest of the message by default.

**Include the "why" as well as the "what".** Explain briefly what's being done. This is in the context of the commit - it needs to be more granular than just the headline name of a big feature. Bear in mind that the detail of the "what" can be found in the diff. The "why" however isn't always apparent or immediately clear, so do include it in the message. For more complex changes or refactorings, a brief description of the "what" can be helpful.

**Reference relevant issue tracker IDs, as per project conventions.** These identifiers allow further information around a change to be found conveniently. Most commonly, it's for the issue currently being worked on, but could also be other useful and relevant issues. The former case can be automated using a source control branch-detecting commit message hook, such as [this one](https://github.com/robatwilliams/git-ticket-number-prefix-hook).

*For more on why good commit messages matter, I recommend the introduction section in particular of this ["How to Write a Git Commit Message"](https://chris.beams.io/posts/git-commit/) article by Chris Beams.*


## Committing

**Preserve line history.** Source control tools can display a line-by-line view of the last change made to each line (often called "annotate" or "blame"). Committing changes and then making later commits to change the code back to how it was, makes this feature less useful. Editing such commits, or combining ("squashing") groups of commits where there has been significant churn, can help in such situations.

**Look at what's being committed.** It's all too easy to add all changes present in your working folder, ready for a quick commit. Adding each file individually however, quickly reviewing and the changes in each one as you go, gives you an opportunity to notice anything that's amiss.
