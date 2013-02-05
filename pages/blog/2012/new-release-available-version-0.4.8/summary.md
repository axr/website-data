We're proud to announce our first developers' preview release! After countless
hours of hard work, we've finally come to a point where can put out the first
in a series of milestones that will be coming over the next couple of months.
So much has happened since we last published a blog post that it will be hard
to truly cover everything, but I'll try to summarize where we are right now.

For starters, a lot has changed under the hood. We completely removed a miriad
of dependencies (along with their transcient dependencies), and now rely
entirely on the [Qt library](http://qt.digia.com/). Cairo, Pango, Boost, Expat,
Glib, SDL... all gone! Also, we modularized...
