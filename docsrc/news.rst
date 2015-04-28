.. _news:

News
====

GeoNetwork opensource v3.0.0 released
-------------------------------------

Date: 28 April 2015

We're pleased to announce the release v3.0.0 of GeoNetwork opensource.
This is a major release with a completely new user interface and a lot of new functionality.

Proceed to :doc:`downloads` and enjoy!

Thanks and congratulations to the all community members!


GeoNetwork opensource v2.10.4 released
--------------------------------------

Date: 22 December 2014

We're pleased to announce the release v2.10.4 of GeoNetwork opensource. 
This is a minor release that includes bug fixes discovered in earlier versions. 

Proceed to :doc:`downloads` and enjoy!

Thanks and congratulations to the all community members! 

Jeroen Ticheler

Here's an overview of fixes to this version:

* #354 ConcurrentModificationException in spring security interceptor when selecting metadata records
* #358 Widgets metadata editor: link of related resources window doesn't render properly
* #372 Metadata update by XML / record title and abstract not displayed in search results when having a default namespace
* #376 Installer stalls/bails out on windows x64 when creating shortcuts
* #377 Installer .exe on windows7 x64 can't find java: "Cannot find java 1.5.0"
* #382 Metadata delete service throws NumberFormatException if the uuid provided doesn't exist. Use a meaningful exception instead
* #387 Postgres database loading hangs webapp when trying to drop services and serviceparameters table
* #394 ExtJs search and tabsearch apps doesn't show any message when login is not valid
* #401 Widgets UI (htmlui) lacks of some search fields in the advanced search panel
* #403 Pagination buttons are not displayed on the top of the search results in the widgets UI (htmlui)
* #413 Tab search widget UI doesn't show correct groups in the advanced search panel
* #422 Harvesters break when the change date of metadata makes fail the ISODate parsing
* #425 Transfer ownership doesn't add the permissions for the new user/group properly
* #431 WAF harvester doesn't process folders
* #441 Metadata editor can be accessed after user logout in html5ui (saving metadata fails as expected)
* #453 Suggestion processes (like inspire-add-conformity) that include thesaurus files doesn't work when running GeoNetwork in windows
* #455 Metadata share links in html5 UI are broken
* #465 html5ui metadata editor doesn't highlight in red mandatory elements if empty
* #473 Widgets UI (htmlui): Sorting results issues
* #497 using 8 threads to batch import causes index to deadlock
* #506 XLink processing on local:// fails due to null servlet context in detachXLinks
* #507 XLink processing on local:// consumes all available database connections
* #509 font-awesome woff files get changed by maven/installer
* #511 GetCurrentMDTab service should retrieve the default view from the settings
* #532 html5ui: login when viewing a record does not change actions menu
* #534 html5ui: delete with record in viewer leaves viewer active
* #535 Harvesters consuming database connections
* #538 The CSW harvester doesn't update the change date of the local metadata
* #541 Changes in the scheduler of a harvester type affects all other harvester schedules of same type
* #542 CSW harvester can't be saved with a search criteria defined
* #543 CSW Harvester: only the first search criteria group is stored in the database
* #550 Metadata set thumbnail service doesn't use the preferred protocol
* #582 CSW harvester: removing the search filter doesn't work
* #612 xml.metadata.privileges returns an HTTP 403 error
* #655 Add search criteria in harvesters fails in Internet Explorer
* #656 Editing a harvester in IE causes a javascript 
* #677 Classic UI: Metadata view links in metadata show cause a javascript error in debug mode


GeoNetwork opensource v2.10.3 released
--------------------------------------

Date: 30 January 2014

We're pleased to announce the release v2.10.3 of GeoNetwork opensource. 
This is a minor release that includes bug fixes discovered in earlier versions. 

Proceed to :doc:`downloads` and enjoy!

Thanks and congratulations to the all community members! 

Jeroen Ticheler

Here's an overview of fixes to this version:

* #289 getGNServiceURL function adds extra slash if the parameter starts with slash
* #299 Select all in page breaks IE8, fails in IE9, slows selection in Firefox
* #305 Date filter calendars in Advanced Search (classic UI) render wrongly in Chrome/Safari bug
* #308 CSW ExceptionReport version is incorrect
* #318 SchemaLoader cannot use oasis catalogues
* #319 GML3.2 namespace geometries not supported by SpatialIndexWriter
* #334 Metadata editor: datetimes values are lost in IE after editing and saving the metadata bug
* #339 xml-commons resolver library returns invalid urls on windows
* #345 use eclipse URIUtil to handle URIs
* #347 Using thesaurus name for radio button group in ConceptSelectionPanel.js can cause metadata.update to fail
* #355 metadata select all on page in html5ui causes hundreds of metadata.select requests when catalogue has lots of records (eg. 20k)
* #357 Autocompletion / value should be analyzed enhancement
* #360 Localize tooltip for map preview 'open bigmap button' html5ui
* #362 "home" button points to the wrong place
* #363 Can't delete a logo 
* #368 Widgets / relation panel / display relation if no distribution section
* #373 LDAPUtils tries to put null into password field in Users table - causes database constraint violation in databases that care bug


GeoNetwork opensource v2.10.2 released
--------------------------------------

Date: 22 October 2013

We're pleased to announce the release v2.10.2 of GeoNetwork opensource. 
This is a minor release that includes bug fixes discovered in earlier versions. 

Proceed to :doc:`downloads` and enjoy!

Thanks and congratulations to the all community members! 

Jeroen Ticheler

Here's an overview of fixes to this version:

 * #267 HTML5 UI: Use WMC context in map and allow OSM layers
 * #271 Transfer ownership displays target users repeated
 * #266 HTML5 UI: Hide special groups from New Metadata panel
 * Merge pull request #265 from Delawen/origin/2.10.x
 * Fixing a really weird bug on IE I don't even know how to report.
 * Merge pull request #263 from Delawen/136
 * Check if we passed an override parameter for layers #136
 * Merge pull request #227 from kristjanr/PressingEnterKeyWhenSearching
 * #257 WMS harvester thumbnail issue (classic UI)
 * Merge remote-tracking branch 'origin/2.10.x' into 2.10.x
 * Editor / XML view / Do not escape &#10; (#254).
 * #247 HTML5 UI: Context menu in search results displaying admin options when unlogged
 * Fix email size for group - live fix from GeoNetwork workshop in FOSS4G2013.
 * #246 HTML5 UI: Click on search result metadata title doesn't open the metadata detail page
 * #241 Fix MySql create sql script
 * Merge pull request #220 from ianwallen/Branch_a6a1b2af565d7e159c4a644e8c82475063912773
 * Merge pull request #221 from ianwallen/Fix_Issue_174
 * Fixed issue when the referer was null
 * Merge pull request #173 from ianwallen/Jetty-7.6.8
 * Fix issue 213 Fixed issues related to last commit (dcd363f2cb8cbb08a0113a370c0fcc506061aa8b)    - characterset issue with ita    - commited conflict info from nor
 * Fix bug edit linkresource service selection
 * Widgets / Editor / User defined frequency is not properly saved.

GeoNetwork opensource v2.10.1 released
--------------------------------------

Date: 24 July 2013

We're pleased to announce the release v2.10.1 of GeoNetwork opensource. This is a minor release. 

:doc:`downloads`

GeoNetwork opensource v2.10.0 released
--------------------------------------

Date: 14 June 2013

We're pleased to announce the release v2.10.0 of GeoNetwork opensource. This is a major release that adds a lot of new functionality to the software. 

:doc:`downloads`

Here's a non-exhaustive list of `new features <http://geonetwork-opensource.org/manuals/2.10.0/eng/users/quickstartguide/newfeatures/index.html>`_.


