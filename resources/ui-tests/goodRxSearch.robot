*** Settings ***
Documentation                   This is the driver script for the test automation
Resource                        ${EXECDIR}/support/variables.robot
Resource                        ${EXECDIR}/resources/ui-keywords/ui_base.robot

Resource                        ${EXECDIR}/resources/ui-keywords/page_search.robot
Resource                        ${EXECDIR}/resources/ui-keywords/page_search_results.robot
Resource                        ${EXECDIR}/resources/ui-keywords/page_coupon.robot

Library                         SeleniumLibrary
Suite Setup                     Read Test Config File
Suite Teardown                  Close Browser
Test Template                   Search By Drug Name

*** Test Cases ***
Search For Amoxicillin          Amoxicillin
Search For Advil                Advil
Search For True Metrix          True Metrix


*** Keywords ***
Search By Drug Name
    [Arguments]    ${drug}
    Open GoodRx Webpage
    Search Rx      ${drug}
    Search Results Page

Close Browser
    Close All Browsers