# Dependencies

**Consider if there's a real need to use a library/tool.** If the task at hand can be done with a few lines of straightforward code, it may not be worth adding a new dependency. Be familiar with the latest platform/SDK and already-present libraries - what you need may already be available.

**Choose libraries/tools carefully.** Consider factors including quality, popularity, documentation, "aliveness", deprecation, and strength of community. Review alternatives. Depending on the nature of a library, its use may be localised in an area of a project - or widespread and intertwined with application code. The latter ones require particular care.

**Internal company libraries/tools/frameworks don't get a free pass.** These are just as susceptible to issues as open-source ones (perhaps even more so). They may for example be of poor quality, undocumented, or abandoned. Internal libraries rarely have a community, and aren't subject to consumer-selection like open-source ones are.

**Ensure the licence is compatible with our usage.** Some licences are not compatible with typical commercial usage. The [Choose a Licence website](https://choosealicense.com/licenses/) has a convenient summary of the most popular licences.

**Use the latest non-beta versions, generally.** These should be stable, include the latest features and bug fixes, likely to receive bug fixes, and have readily-accessible documentation. Newly-released major versions of dependencies that interact closely with others, or have a plugin ecosystem, may be worth deferring until the surrounding landscape catches up and settles down.

**Check that libraries don't bloat your built artefact.** This applies if your application is delivered to users over the internet - on the web, or as a mobile app. Use [tools](https://github.com/webpack-contrib/webpack-bundle-analyzer) from the ecosystem to analyse built artefacts.

**Follow established patterns and idioms for a given dependency.** Major libraries, frameworks and tools most often have an established way of using them effectively. This may be a combination of official and community-driven. Familiarising yourself with it will help you get the most out of them and avoid antipatterns. Read more than just the getting-started page.

**Avoid reimplementing library/framework features due to ignorance.** Try to be familiar with the "headline features" of what's already available. It's impossible to know everything and keep up to date, so you may find the following rules of thumb to quickly consider if something's likely to already be available: 1) Am I likely to be the first ever person using library-X that needed this feature? 2) If I was writing my own library-X, would I include this feature?
