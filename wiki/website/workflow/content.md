All development is done on `develop` branch. No changes directly on `master`
branch are allowed. Master will be always kept in sync with current production
code.

Here are some basic rules:

- Never use fast-forward merge. This can be done by supplying the `--no-ff` flag
  when merging.
- Use "Close #<issue number>" in the commit message to automagically close the
  issue
- Use present tense in commit messages
- Include issue reference if possible
- Commit messages must be descriptive and contain more than two words

## Feature branches

It is important to keep develop branch always working. It means that no breaking
changes are allowed on develop. If you are implementing something that takes
long time to do, create a feature branch.

If the feature is directly connected to an issue, then the branch name should be
in `issue-N` format, where N is the issue number, but any branch name except
`master` and `develop` is allowed.

When you have finished implementing the feature and think it is stable enough,
it can be merged into develop branch. (Remember to use non-fast-forward merge)

## Hotfixes

To do a hotfix, all you need to do is merge your commit(s) into master. Just
make sure that your hotfix is stable and will not break anything.

## Deployment

There will be an automatic system for deploying the master branch to the
production site. Right now the deployment is done manually by the web team
leader.

Before any deployment the updated pages need to be tested on at least IE,
Firefox and Chrome.
