# The Meta Guide to Upgrading Ember

####(Or, how I learned to stop worrying and love the SemVer)

I’ve seen lot of fretting about how to keep up with Ember.  Most of that fretting has been unnecessary.

This is a post in 5 parts:

1. [General Guidelines (and why you’re worrying too much)](#general-guidelines)
2. [Step-by-step guide to doing a minor version upgrade](#step-by-step-minor)
3. [Step-by-step guide to doing a major version upgrade](#step-by-step-major)
4. [Notes specific to each upgrade](#release-specific-notes)
5. [Credits and comments](#credits-and-comments)

This guide, especially part 4, is a living document.  Please send me suggestions.

# <a name="general-guidelines"></a>General guidelines

## 1. Ignore RFCs
 
RFCs are amazing.  I get a thrill when I look at them.  They’re literally the future!  And the fact that all this important work is being done in the open never ceases to astound me.

However, they are also very dangerous to your psyche.  When you read one, you think “this is how Ember is supposed to be.  This is the correct way to Ember”. However, those features often don’t get implemented for several months to a year after the RFC is released.  During that year-long gap, you have in your mind the new RFC method as the “right” way, and the old way of doing it as the “wrong” way- but the only way you have available is the old “wrong” way.  This leads to a predictable amount of fretting about being “always behind”.

As an example: as I write this, neither Routable Components nor Glimmer Components (formerly known as angle-bracket components) are released yet.  However, I’ve had several people ask how to upgrade to them, confess that they’re “behind the times” since they’re not using them.

Let me repeat: we have people feeling guilty over not using features that *haven’t been released*.

Stop Worrying and Love the SemVer.

## 2. Stop planning ahead for how you’re going to take advantage of new features

New features are there for your convenience, not for your guilt (especially the ones that haven’t been released yet).  And yet, I’ve seen many people worry about how to make their code more aligned with *future* deprecations and features.

Here’s all you need to know: The Ember Core Team deprecates as early as possible… but they never deprecate without an upgrade path.  So if you’re not getting a deprecation warning, that means they don’t have the upgrade path fully worked out yet.

If you just upgrade whenever there’s a deprecation, you have one relatively easy step.  If you try to plan ahead to make room for unreleased features, you’re adding two steps (guessing the future and implementing around the future), both of which are harder than the final implementation step (which, for all your troubles, you make only slightly easier).

Stop Worrying and Love the SemVer.

## 3. Take upgrades step by step

“Upgrading” doesn’t have to be one big-bang commit, and it doesn’t have to cause problems.  However, an undisciplined approach can be trouble for large apps.

This happens for several reasons:

* You use private APIs.  Even though Ember follows SemVer, SemVer doesn’t apply to private APIs.
* Your addons use private APIs.
* Deprecation warnings, if not controlled, can spew into your console and make debugging a challenge.
* A long-running upgrade branch has merge conflicts with the main branch, or (even worse) merging the long-running upgrade branch in causes silent errors that were in neither the main branch or the upgrade branch.

Luckily, there are discrete steps that you can take to minimize long-running branches, deprecation spew, and regressions.  The second part of this post is dedicated to those discrete steps.

# <a name="step-by-step-minor"></a>Step-by-Step guide to doing a minor version upgrade

The following are a set of 7 discrete steps you can follow to create a smoother upgrade process.  Steps 5 and 6 are usually the most difficult, but you can avoid a long-running branch by merging back into master anytime after step 4.

1. [Upgrade version number of Ember in bower.json, run bower install](#step-1)
2. [Run test suite and fix any broken tests](#step-2)
3. [Run ember-cli-deprecation-workflow and temporarily mute all deprecation warnings](#step-3)
4. [Run performance tests](#step-4)
5. [Fix deprecated code](#step-5)
6. [Scan the new features added in new version of Ember](#step-6)
7. [Repeat for next version](#step-7)

It’s worth noting that if you have a small app then you can usually get away with just doing steps 1 through 3.  However, you *will* be creating technical debt, and the longer you do it the worse it will get.  I recommend following the steps and doing a proper upgrade.

So, now that you're ready to do a proper upgrade, here's more details on how you'll accopmlish each step.


### <a name="step-1"></a>1. Upgrade version number of Ember in bower.json, run bower install
	
Upgrade it by one minor version at a time.  Be sure to run `bower install` and then restart your app.

This is the easiest of the steps.  Enjoy this.

### 2. <a name="step-2"></a> Run test suite and fix any broken tests

You have a test suite, right?  Right?  If not, you’re probably better served by first writing a few happy path acceptance tests. Go do it now; we’ll wait. The time you spend now writing a few acceptance tests will make every other change you make in your app, EVER, safer and faster.  While a fully robust test suite can take time and be a challenge, testing your happy paths is a huge win and can be done relatively quickly.

Since this is a minor version upgrade there shouldn’t be much broken, if at all.  If there is, it’s likely that a private Ember API got changed.  Changes for private APIs are usually telegraphed one version ahead, so if something’s broken either a) you skipped a version, b) you were ignoring a deprecation warning on your last upgrade, or c) you used a private API that the core team didn’t think anyone had found, earning the title of Super Cowboy.

### 3. <a name="step-3"></a>Run ember-cli-deprecation-workflow, and temporarily mute all deprecation warnings

After you fix any new bugs, there will still be lots and lots of deprecation warnings (for large apps: hundreds.  Especially on the upgrade to 1.13).  We’re not fixing them yet - that’s step 5 - we’re just getting them out of the way.

We're going to use [ember-cli-deprecation-workflow](https://github.com/mixonic/ember-cli-deprecation-workflow) to mute the deprecation warnings.  It’s easy to set up and use.  It selectively blocks certain deprecation warnings based on a config file, and it lets you tackle deprecations one at a time (without bothering your coworkers).  We're not going to cover usage of ember-cli-deprecation-workflow in this guide, but the README (see above link) is good, and [I made a video about it](https://www.emberscreencasts.com/posts/71-upgrade-ember-with-ember-cli-deprecation-workflow).

### 4. <a name="step-4"></a>Run performance tests

If you have performance metrics, use them.  Each successive Ember version should be faster for most apps, but in some situations an upgrade can cause a performance regression. If you don’t have speed metrics, find your lowest-performing pages and make sure it doesn’t feel worse than before.

INTERLUDE: If your tests are working and you don’t have performance regressions, you can merge all of your changes (including the version upgrade) back to master!  You can also keep merging your changes back to master as you make progress on steps 5 and 6.  Steps 5 and 6 are all about making sure your *next* version upgrade goes smoothly.

Now on to the biggest step:

### 5. <a name="step-5"></a>Fix deprecated code

This is going to take a while, but most of it should be fairly rote.  The core team is good about providing upgrade paths for each deprecation.

First, run [ember-cli-deprecation-workflow](https://github.com/mixonic/ember-cli-deprecation-workflow).  The README is fairly clear, but if you want more info you can [watch my video](https://www.emberscreencasts.com/posts/71-upgrade-ember-with-ember-cli-deprecation-workflow).  The README assumes you have tests, but if you don’t have them you can get the same result by clicking around in your application. But really, you should write some tests. Imagine all the clicking around it will save you!

Once you’ve gotten your file of deprecations that you’ve blocked, just start commenting them out line by line and fixing the deprecations.

If there are some deprecations that don’t seem to be solvable, check your addons.  Fixing those deprecations may be as simple as upgrading an addon.  If the problem is in an addon but they don’t have a new version out yet, consider submitting a PR to the addon that fixes the deprecation warning.  Hundreds (or thousands, depending on the addon) of embereños will thank you.

There are some deprecation warnings that are just really stubborn.  If they’re not for an about-to-be-broken private API, they don’t technically have to be fixed until you do a major version upgrade. 

### 6. <a name="step-6"></a>Scan the new features added in Ember upgrade

Usually a good source for this is the release blog post on the official emberjs.com blog.  We’ve also made some notes that may be helpful in Section 4 of this post.

Use your judgment on which ones you should take advantage of, based on how much code you think they’ll save, how you think they’ll affect performance, and how much time you have.  You’re not obligated to take advantage of every new feature.

### 7. <a name="step-7"></a>Repeat for the next version

## <a name="step-by-step-major"></a>Step-by-Step guide to doing a major version upgrade

1. Upgrade to the latest minor version in the line- including patch numbers.  So 1.13.10 (or higher, depending on when you’re reading this), not 1.13.0.
2. Make sure you don’t have any deprecation warnings.  You want your `config/deprecation-workflow.js` file to have an empty array, and you want your console to be nice and clear.
3. Set the version of Ember in bower.json to the next major version, run bower install, restart your app.
4. Make sure tests and performance are still good.  If you did step 2 correctly then the tests should be fine, and performance should have improved.

These are just slightly mixed-up versions of some of the steps for [doing a minor version update](#step-by-step-minor), so I'm not going to do detailed notes on each one.  Major versions are actually super easy (after you’ve done the massive amount of groundwork involved in getting rid of deprecations).  Yay!

## <a name="release-specific-notes"></a>Release-specific notes

These notes are about significant new features, deprecation warnings, and performance changes that are specific to each release.  Here’s how to deal with each type:

* deprecation warnings: fix, if at all possible
* new features: use IF they’re very helpful to you and you have time.  You can always go back later.  With that said, some new features come paired with a deprecation warning- as in, the deprecation warning is for the old way of doing things and is meant to push you onto the new feature.  You'll use those features right away.
* Performance changes: These *usually* shouldn’t be a big deal.  If you have a small-ish app and you don’t have excessively long lists, you shouldn’t need to worry about it.

You can jump directly to the upgrade you're doing:

* [1.11](#1.11)
* [1.12](#1.12)
* [1.13](#1.13)
* [2.0](#2.0)

<a name="1.11"></a>1.11
----
* new feature: [bound attribute syntax](http://emberjs.com/blog/2015/03/27/ember-1-11-0-released.html).  It’s amazing!  Will save you code! 
* bound attribute syntax creates [some concerns about escaping your code properly](http://emberjs.com/blog/2015/03/27/ember-1-11-0-released.html#toc_escaping-content-in-htmlbars)
* new feature: inline if `{{if isEnabled 'active' 'disabled’}}`
* new feature: each block has an index block param
* new feature: named substates (for using loading and error in application route)
* new feature: component helper `{{component componentName args}}`, great for metaprogramming
* performance improvements of ~20% according to some reports
* deprecation notes: ObjectController
     * get rid of the deprecation asking for ‘model.property’ before you change ObjectController to Controller.  If you do the order wrong, you’ll lose the deprecations for ‘model.property’ and they’ll show up as errors instead.

<a name="1.12"></a>1.12
----
* new feature: computed get/set syntax!  [There’s an ember-watson command for that](https://github.com/abuiles/ember-watson#ember-watsonfind-overloaded-cps-path)
* new feature: instance initializers.  This will help speed up your tests!!!!!
     * [Screencast on application initializers](https://www.emberscreencasts.com/posts/80-inject-code-with-application-initializers)
     * [Screencast on Instance Initializers](https://www.emberscreencasts.com/posts/81-load-data-with-instance-initiliazers)
* [breaking change in initializer context?](http://emberjs.com/blog/2015/05/13/ember-1-12-released.html#toc_initializer-context)

<a name="1.13"></a>1.13
----
* performance notes:
	* 1.13 is [the slowest Ember in a while with regards to initial component render](https://github.com/emberjs/ember.js/issues/11502), because it has to support both Glimmer and pre-glimmer.  2.0 throws off a lot of that cruft, and is faster… but not as fast as 1.12.
	* However, 1.13 is significantly faster on *re-render* (thanks Glimmer!), so everything after initial load of the component is faster.
* 1.13 will have the most deprecation warnings.  Seriously, [more deprecations were added in 1.13 than in 1.7-1.12 combined](http://emberjs.com/deprecations/v1.x/#toc_deprecations-added-in-1-13) (look at that scrollbar)
* Ember Data will cause deprecation warnings in Ember 1.13 unless Ember Data is also at 1.13.  Someone else can write the Ember Data upgrade guide.  When you do, I'll link to it here.
* new feature: [closure actions](https://www.emberscreencasts.com/tags/actions)
* new feature: [Helper API revamped](http://emberjs.com/blog/2015/06/12/ember-1-13-0-released.html#toc_new-ember-js-helper-api)
* new feature: [new keywords in component blocks](http://emberjs.com/blog/2015/06/12/ember-1-13-0-released.html#toc_component-block-info)

<a name="2.0"></a>2.0
----
IF all deprecation warnings from 1.13 are taken care of, you should be able to upgrade with no fuss.  There were purposefully no new features or deprecations released in 2.0, just removal of code that supported the previously-deprecated features.

<a name="2.1"></a>2.1
----

Coming soon

<a name="2.2"></a>2.2
----
Coming soon

Other
----
ember-cli 1.13.9 has a new destroyApp helper.  Theres an [ember-watson task](https://github.com/abuiles/ember-watson#ember-watsonuse-destroy-app-helper-path) to help you upgrade.

<a name="credits-and-comments"></a>Credits
----

I’d like to thank altSchool, which commissioned the first version of this document.  They’re wonderful to work with, they’re doing amazing work, and they’re hiring Ember devs. Find out more by visiting https://www.altschool.com/jobs.

If you enjoyed this, I’m putting out new videos about Ember every week at [emberscreencasts.com](www.emberscreencasts.com).  You might enjoy learning from them.
