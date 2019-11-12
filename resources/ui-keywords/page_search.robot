*** Settings ***
Documentation                       This robot file is a description of web elements and the actions available on the projects page
Library                             SeleniumLibrary


*** Variables ***
${search_bar}                       css:[class="form-group -large"]>[class="hero-search"]


*** Keywords ***
Search Rx
    [Arguments]                             ${rx_name}= Amoxicillin
    Wait Until Element Is Visible           ${search_bar}                       timeout=40s
    Input Text                              ${search_bar}                       ${rx_name}
    Press Keys                              ${search_bar}                       RETURN