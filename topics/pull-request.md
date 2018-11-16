# Pull request

*Pull request and code review process is highly specific to individual team circumstances and preferences. The points here inevitably reflect my experiences, but many of them should be general/adaptable enough to be relevant for other teams. Do what works for your team to get the most benefit out of time spent by authors and reviewers.*

*To read more about pull requests and code review - including culture, conduct, practices, and tools - start with [the code review awesome list](https://github.com/joho/awesome-code-review).*

----


## General

**Strive for small pull requests.** Large pull requests are harder to review, resulting in poorer feedback, unnoticed problems, "speed reviewing", and slow progress towards approval. If you're unable to split up work items for large features (due to process or politics), consider an incremental technique involving a series of smaller (e.g. 200-400 line) pull requests into a "collector branch" culminating in a single big pull request from that branch to the master/trunk.

**Strive for short-lived pull requests.** Any in-progress or in-review work on a branch is not yet part of the master/trunk that others are basing their work on. That can lead to conflicts which are time-consuming and error-prone to resolve. Being open for a long time increases the likelihood that a pull request will be open for an even longer time - as it requires updates after other pull requests are merged ahead of it (possibly involving conflict resolution). Consider setting some general and "SLA-type" ground rules to promote short-lived PRs, for example: review within *n* hours of being submitted, and review PRs or address feedback before starting new work. Making small pull requests helps keep them short-lived.

**Automate the tedious things.** Configure the build to require passing code style and static analysis checks. Such issues are quicker, cheaper, and more consistently detected by tooling than people.

**Set expectations up-front.** Make it easy for contributors to submit pull requests that will be approved first time, or at least without requiring major changes. Things that help with this include clear requirements, common understanding of application architecture and programming patterns/practices, and sharing design ideas before implementation starts.


## Before submitting

**The build succeeds.** This includes running tests and automated code quality checks.

**The branch is up to date with the target branch.** This is the only way of ensuring that the changes to be merged are compatible and integrated with the latest version of the target branch. This is done by merging the target branch into the source branch (or rebasing target on source).

**Self-review the code.** Read the requirements, and review your own code. This is an opportunity to spot any issues or things that were missed, and fix them immediately - increasing the likelihood of first-time approval.

**Complete the pre-submit checklist.** Checklists help everyone remember things that need to be done. What needs to be on the pre-submission checklist depends on the team and project, and should evolve over time - for example, what things are always coming up as feedback. To avoid diluting its importance, it shouldn't be too long or include trivial things. If the repository supports [templates for pull request descriptions](https://help.github.com/articles/creating-a-pull-request-template-for-your-repository/), create one containing the checklist - otherwise, a bookmarklet to quickly populate the pull request description field can help.

**Update the issue tracker ticket (if applicable).** If there have been clarifications, corrections, or amendments to the requirement made through other channels (email, IM, in-person), document these. This helps ensure that everyone (reviewers, testers, product owner) are using the correct information as the feature/fix makes its way towards being released.

**Add "insider insights/advice" for testers.** This is any useful information you feel that would help them, from your experience in implementing/fixing the requirement/bug - things that can't be known without reviewing the code changes. Add it to the issue tracker ticket. Examples include: things that were tricky to implement, seemingly unrelated areas/features that are affected (e.g. if a common component was modified), and scope of refactoring changes or technical tasks.


## Submitting

**Provide an informative title.** It's helpful to be able to quickly identify a pull request among many that are open on the repository. This isn't possible when the issue tracker id alone is used as a title.

**Provide information to help reviewers try out the change.** Examples include location of suitable test data, specific user type/configuration required, and service endpoint details. Add relevant parts of this to the issue tracker ticket as well.

**Add comments with time-saving hints.** Think as a reviewer, and add comments that'll help them make good use of their time. For example, point out code that has simply been moved, explain a noisy area of diff where there's little actual change, or explain an area that's likely to prompt requests for explanation.

**Draw attention to areas of code that require attention.** Avoid relying on reviewers picking up on things (or hoping that they don't). Having done the work, it's likely that you understand it in a deeper way than reviewers. Comment on things that don't feel quite right (new or existing), things you're unsure about (requirements or technical), or decisions of interest that you've made.


## Reviewing and giving feedback

**Review the entire change.** Everything in the codebase contributes directly or indirectly to the features and quality of the application. Avoid considering certain areas less worthy of review, and skipping them - for example tests, tooling, or stylesheets.

**Run the code.** Just because it looks ok, doesn't mean that it does the right thing. If the project tooling makes it difficult for people to switch between their own work and running review branches, fix that.

**Look out for... everything, really.** Draw on your experience, knowledge, guides, and anything else. Does it do the right thing, does it make sense, is it good, is it maintainable, is it tested, are the assumptions/interpretations made clear and valid, etc.

**Ask questions.** Code review helps share knowledge of the codebase among the team, and helps contributors learn from each other. If something isn't clear or isn't understood, ask about it. If the entire change is hard to review and difficult to grasp, it may need improvement.

**Make clear comments, explaining reasoning where not obvious.** The immediate benefits include avoiding requests for clarification (which delay progress), and avoiding unexpected revisions made due to misinterpreted comments. The longer term benefit is the levelling-up of other participants as authors and reviewers. That helps improve overall quality, as it's usually impractical for a single person to review all changes.

**Look for missing pieces of the jigsaw.** The current code, plus the changes under review, plus other backlog work items - will at some point make up a releasable version of the software. Point out anything you think is missing but required - a backlog work item may need to be created for it.


## Addressing feedback

**Address all instances that a comment applies to.** Reviewers may not have noticed all places where a comment applies, or refrained from commenting on all of them to avoid causing noise (a good practice). Consider if the point made by a comment applies in other places beyond the specific line it was made on.

**Make it easy for reviewers to review revisions.** Depending on the repository/tooling in use, editing existing commits can make it difficult to see what was changed. Fine-grained commits that address individual comments (or logical groups thereof) are convenient to review and correlate to the original comments - allowing reviewers to see what changes were made in response to their feedback. They also create better version control history. Single wide-ranging commits entitled along the lines of "address pr comments" have none of these benefits.

**Minimise repeated back-and-forth.** Some things are easier to resolve with a conversation, rather than repeated cycles of changes and comments, or long-running comment thread discussions. When you spot one of these back-and-forth/churn situations, have a conversation or suggest a short pair-programming session.


## Before merging

**The build succeeds.** Configure tooling (repository and CI server) to require a successful build of the latest version of the branch before merging is allowed.

**The branch is up to date with the target branch.** Configure the repository to require that the source branch not be behind target before merging is allowed.

**All comments have been resolved.** This normally means making revisions, answering a reviewer's question (to their satisfaction), or concluding a discussion. It can be difficult to track outstanding comments - repository features such as reactions (thumbs-up etc.) or task checkboxes can help. Configure the repository (if supported) to require that all tasks are completed before merging is allowed.

**All checklist items are checked.** A pull request checklist may include pre-merge items in addition to pre-submit ones.

**Adequate approval has been given by reviewers.** What's adequate depends on the team and project. A minimum number of approvals is usually required. It may be necessary to further require one/few approvals from a group of people deemed responsible enough. Configure the repository (to whatever extent supported) to require these approvals before merging is allowed. Further, use good judgement to decide if approval should be sought from particular people such as area/domain/technology specialists.

**Approvals still stand, if post-approval changes were made.** Significant revisions can sometimes arise from feedback given by one reviewer after another reviewer has approved. In such cases, the reviewer who had already approved may wish to re-review. Repositories can be configured to revoke approvals when subsequent changes are made, but this tends to become tedious as merges-in or trivial changes trigger it.
