symfony-warmup
==============

Symfony has a cache triggered when loading the first time a page.
This cache cannot be activated first with app/console cache:clear or app/console cache:warmup.

This perl script is gathering a list of all the routes of a symfony application and call each of them in order to trigger the cache.

This script should be called before any symfony2 deployment.

TODO: improve it to access private pages (with authentification)