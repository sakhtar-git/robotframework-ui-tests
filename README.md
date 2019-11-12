# Robot Framework Project

developed in Robot Framework

## Getting Started
These instructions below will help you to set up the test automation to run on your local 
and verify GoodRx website

### Installation and set up
* $ python --version
* Install pip - https://www.makeuseof.com/tag/install-pip-for-python/
* Set up virtualenv https://packaging.python.org/guides/installing-using-pip-and-virtual-environments/
* Inside venv -
	1) pip install robotframework
	2) pip install --upgrade robotframework-seleniumlibrary


The automation framework designed to support web UI test is structured as follows:
```
     |-- resources
           |- keywords
                |-- base.robot
                |-- page.robot
           |- tests
                |-- testcases.robot
     |-- support
           |- variables.robot
     |-- tesconfig
           |-- qa_env.json
                 
```

### Test Cases
* Verify search for a valid drug/medicine 
* Verify discount coupon price
* Verify free coupon price
* Verify the price matched on search results vs coupon details pages

Other test cases can be automated for Desktop and Mobile - Web UI:
* Layout of the GoodRx home page- UI elements- Navigation/Links, footers, button, input textbox, etc
* Search -  valid prescription name, no input, invalid, auto-type and select
* Recently viewed- select and clear all
* Sign up Process - existing/new - email/ mobile number
* Get a GoodRx Prescription Discount Card page and enrollment
* How GoodRx Works page - links, videos, etc
* Advertisement section - click on ads
* Prices - Set your location/Detect My Location/Change
* Prescription Settings section and Share option
* Mobile App page- Get the Free App launch page
* GoodRx Mobile App Download page UI element verification and Text me the app with valid/invalid phone numbers


### Running the tests

* Make sure you are at the right directory - *sdet-assignmnet*
* From command line -  "robot --loglevel DEBUG -v TEST_ENV:DEV resources/ui-tests/goodRxSearch.robot"

### Review the test results
 
 The test report is generated:
 * html report - open in browser - "open report.html"



