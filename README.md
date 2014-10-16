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

* command: `mr-fetch`
* options:
  * http auth
  * http req headers (cookies, etc.)
* input (two modes):
  * single URL (one-shot)
  * list of URLs via stdin (pageset)
* task: get markup of provided URLs
  * fetch
    * via curl?
    * via phantomjs?
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

* input: run ID, accessibility options
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
  * created_at
  * url
  * page_version_ids: []

* page_version
  * (id)
  * page_id
  * created_at
  * http_status
  * http_headers
  * http_headers_parsed: []
    * (name/value pairs)
  * html_source
  * html_source_rendered
  * metadata
    * title
    * ???
  * page_version_reports: []

* page_version_report
  * (id)
  * page_version_id
  * report_type_id
  * created_at
  * data (custom JSON)

* report_type
  * name (a11y|link|spelling|har|...)
  * processor?

* pageset
  * (id)
  * name
  * page_ids: []
