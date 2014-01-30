.. _news:

News
====

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


