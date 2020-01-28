# 2. Development direction for devstack

## Status

Accepted, circa January 2020.

## Context

The edX Docker Development Stack (henceforce just "Devstack")
that exists in this repository has
served as the canonical edX development environment since
we moved off of
[Vagrant Devstack](https://edx.readthedocs.io/projects/edx-installing-configuring-and-running/en/open-release-eucalyptus.master/installation/devstack/install_devstack.html)
circa 2017.
This switch seems to have been made in order to aid
developers who needed to develop across edX microservices
in a single development environment,
a task for which Docker Compose (upon which Devstack is built)
seemed well suited.

Based on the number of devstack-related questions in the edX-internal
and Open edX Slack workspaces,
it is clear that Devstack is depended upon by a number of developers.
Exactly how many developers use Devstack and
exactly which of its features they
they depend upon is less clear;
this may be a future good discovery topic.

However, since the edX Tools team has been dissolved,
with its members dispersing to the Architecture and Data Engineering Squads,
Devstack has no clear stewarding team.
A handful of developers continue to contribute
to the repository in the time that they have
to address issues that arise. These include / have included:
* Engineers waste chunks of time by "nuking" and re-provisioning
  their Devstacks when problems arise,
  instead of debugging and then committing solutions back to the repository.
  This is likely due to both Devstack documentation/usability issues
  and a general lack of edX engineering proficiency with Docker and Docker Compose.
* Pulling images for all Devstack services takes a while.
* Starting Devstack takes a while.
* Devstack PR builds were timing out in Travis because provisioning took over an hour.

Engineers have discussed different strategies to improving Devstack.
However, two obstacles stand in the way of a concerted effort for improvement:
1. As mentioned, nobody "owns" Devstack, so it is unclear who would lead such
   an initiative and where the developer resources  would come from.
2. The DevOps team is currently moving us towards Kubernetes for deployment.
   We know that this may open up new and hopefully-improved possibilities
   for local development,
   making us hesitant to seriously invest in the current devstack
   before we are further along on the Kubernetes transition.

Given all of that, it seems that a balance needs to be struck
between the extremes of "completely ignore Devstack"
and "seriously invest in Devstack".

## Decision

We feel that it makes the most sense to take a *medium-term*
approach to Devstack development,
investing in quick-wins where we can,
but making sure not to sink significant amounts of developer time into
refactoring or remaking Devstack.

Here are examples of some successful "quick wins" we have implemented in the past few months:
* [#398](https://github.com/edx/devstack/pull/398): Bring up a single service instead of all of them.
* [#431](https://github.com/edx/devstack/pull/431): Add a shortcut for running a script inside one containers.
* [#449](https://github.com/edx/devstack/pull/449): Allow pulling of images for single service and its dependencies.
* [#463](https://github.com/edx/devstack/pull/463): Allow provisioning of individual services and parallelize Travis tests.
* [#466](https://github.com/edx/devstack/pull/466): Allow provisioning of set of services.

Here is some future work that may be worth investing in:
* Smarter program caching... we don't need to do it on every `dev.up.<service>` call.
* Survey of how Devstack is used, which may be used in (a) improving its current form and (b) designing its successor after the Kubernetes transition.
* Removing cruft from Devstack - there are *a lot* of rules in `Makefile`, many of which are probably unused.
* *If we are sticking with Docker and/or Docker Compose for the forseeable future* - Developer education on those tools.
* __Increased clarity on ownership of edX's devstack, as it exists now and as it will exist in the future.__

## Consequences

We will do our best to continue following the trajectory described in the __Decision__ section.