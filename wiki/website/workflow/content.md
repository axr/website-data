All development is done on `develop` branch. No changes directly on `master`
branch are allowed. Master will be always kept in sync with current production
code.

Here are some basic rules:

- Never use fast-forward merge when merging into a master or when merging from
  a feature branch. This can be done by supplying the `--no-ff` flag.
  when merging
- Use `Close #<issue number>` in the commit message to automagically close the
  issue
- Your commit messages must use the imperative, present tense (as if you are
  giving orders to the codebase to change its behaviour): "change", not
  "changed" or "changes"
- Include issue reference if possible
- Commit messages must be descriptive and contain more than two words

## Feature branches

It is important to keep the develop branch always working and stable. That means
that no breaking changes are allowed on develop. If you are implementing a
bigger feature over a longer period of time, create a separate branch for that
feature.

If the feature is directly connected to an issue, then the branch name should be
in `issue-<issue number>` format, but any branch name except `master` and
`develop` is allowed.

When you have finished implementing the feature and think it is stable enough,
you can merge it into develop. (Remember to use non-fast-forward merge)

## Hotfixes

There are no such things as hotfixes. You will simply do your change on develop
and then merge develop into master from where it will be deployed.

## Deployment

The master branch represents production state. That means that in order to
deploy the code at develop, all you need to do is merge develop into master and
get someone to initiate the deployment process.

In the future we will have an automatic deployment system in place. Then
deploying will be as easy as:

	git checkout master
	git merge --no-ff -S develop

This will merge develop into master and create a signed commit. In order for the
automatic deployment to work, your GPG key must be signed by our deployment
key (87B4122D).

## Links

- [Setting up and using the development environment](/website/development-environment)
