*** Settings ***
Documentation           This robot file is a description of web elements and the actions available on the projects page
Library                 String
Library                 SeleniumLibrary


*** Variables ***
${discount_details}             css:div#clipping
${discount_price}               [class="price clearfix"]>span

*** Keywords ***
Discount Details Page
    Wait Until Element Is Visible           ${discount_details}                 timeout=20s
    ${discount}                             Set Variable                        ${discount_details} ${discount_price}
    ${discount_element}                     Get WebElement                      ${discount}
    ${discount_text}                        Get Text                            ${discount_element}
    [Return]                                ${discount_text}

