# Mister Roboto

TK

----

## spider tool

* input: initial URL, options (limiting, etc.)
* task:
  * spider site, starting at initial URL
  * save data (mongodb, text file, etc.)
    * URL
    * raw markup
* output: log

----

## markup fetcher

* input: list of URLs
* task: get markup of provided URLs
  * fetch
    * via curl?
    * via phantomjs?
  * Q: cookies (sessions, etc.)
  * save data into mongodb
    * run ID (generated)
    * URL
    * served markup
    * rendered markup
      * only possible all assets are loaded
      * store HAR of page load
* output: log
  * compare served markup vs. rendered markup
    * dom nodes that differ

----

## accessibility checker

* input: run ID, accessiblity options
* task: validate served markup on tenon (or other tools)
  * get list of pages based on run ID
  * pass each page's markup to checker
  * store result of each validation in mongodb
* output: log/summary

----

## report generator

* input: run ID
* task: generate report of validation results
  * get list of pages based on run ID
  * query/aggregate validation results
  * generate HTML page (or other rich report)
  * generate result as CSV
* output: log/summary


----

## mongo data model

* page
  * (id)
  * run_id
  * url
  * html_source
  * html_source_rendered
  * metadata
    * title
  * reports
    * a11y
      * created_at
      * data
    * link
      * created_at
      * data
    * spellng
      * created_at
      * data
    * har
      * created_at
      * data
    * ???
  * created_at

* run
  * page_ids (list)
  * project_id
  * begin_datetime
  * end_datetime

* project
  * id
  * run_ids

