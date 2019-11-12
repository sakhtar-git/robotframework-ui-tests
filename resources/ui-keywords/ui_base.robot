*** Settings ***
Documentation                       This file has all the initial set up required for test
Resource                            ${EXECDIR}/support/variables.robot
Library                             JSONLibrary



*** Keywords ***
Read Test Config File
    ${TEST_CONFIG_OBJ}              Load JSON From File         ${TEST_CONFIG_JSON}
    Set Global Variable             ${TEST_CONFIG_OBJ}

Open GoodRx Webpage
    [Arguments]                     ${url}=${TEST_CONFIG_OBJ['search']['base_url']}
    ...                             ${cookie_name}=${TEST_CONFIG_OBJ['search']['cookie_name']}
    ...                             ${cookie_value}=${TEST_CONFIG_OBJ['search']['cookie_value']}
    ...                             ${domain}=${TEST_CONFIG_OBJ['search']['domain']}
    Open Browser                    ${url}                      browser=${BROWSER}          alias=BrowserA
    Add Cookie                      ${cookie_name}              ${cookie_value}             domain=${domain}
    Go To                           ${url}


