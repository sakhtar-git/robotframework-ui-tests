*** Settings ***
Documentation                           This is a collection of variables for UI tests and if needed can be modified
...                                     from command line execution

*** Variables ***
${TEST_ENV}                            QA       #Default Value is QA, can be STAGE, PROD
${TEST_CONFIG_JSON}                    ${EXECDIR}/test-config/${TEST_ENV}.json
${BROWSER}                              Chrome