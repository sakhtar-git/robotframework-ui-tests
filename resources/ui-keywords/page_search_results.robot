*** Settings ***
Documentation                       This robot file is a description of web elements and the actions available on the projects page
Library                             String
Library                             SeleniumLibrary

Resource                            ${EXECDIR}/resources/ui-keywords/page_coupon.robot


*** Variables ***
${precriptionla_panel}              css:div[aria-label="Prescription Settings"]
${div_coupons}                      css:#a11y-prices-start > ul
${price_row}                        css:[data-qa="price_row"]
${drug_price}                       [data-qa="drug_price"]
${get_coupon}                       [data-qa="coupon_button"]
${discount_link}                    xpath://*[@id="modal-OTCModal"]/div/div/div[2]/div/a
${proceed_link}                     xpath://*[@id="uat-attestation-accept-button"]


*** Keywords ***

Search Results Page
    Wait Until Element Is Visible               ${precriptionla_panel}          timeout=20s
    Wait Until Element Is Visible               ${div_coupons}                  timeout=20s
    ${price_rows}                               Get WebElements                 ${price_row}
    ${row_count}                                Get Length                      ${price_rows}

    :FOR    ${index}    IN RANGE    1    ${row_count} + 1
        ${find_coupon}                          Set Variable            ${price_row}:nth-child(${index}) ${get_coupon}

        ${present}      Run Keyword And Return Status    Get WebElement         ${find_coupon}
        Run Keyword If	'${present}' == '${False}'	Continue For Loop
        @{coupon}                               Get Coupon              ${index}

        ${coupon_text}          Set Variable                            ${coupon}[2]
        Run Keyword If          '${coupon_text}' == 'get free coupon' or '${coupon_text}' == 'get free discount'
        ...                     Get Coupon Price On Next                ${coupon}
        @{coupon}               Set Variable                            ${None}
    END



Get Coupon
    [Arguments]     ${index}
    ${find_coupon}              Set Variable                            ${price_row}:nth-child(${index}) ${get_coupon}
    ${coupon}                   Get WebElement                          ${find_coupon}
    ${coupon_text}              Get Text                                ${coupon}
    ${coupon_text}              Convert To Lowercase                    ${coupon_text}

    ${find_price}               Set Variable                            ${price_row}:nth-child(${index}) ${drug_price}
    ${price}                    Get WebElement                          ${find_price}
    ${price_lines}              Get Text                                ${price}
    @{price_text}               Split String                            ${price_lines}          \n
    @{coupon_details}           Create List                             ${index}
    ...                         ${coupon}                               ${coupon_text}                  ${price_text}[1]
    [Return]        ${coupon_details}

Get Coupon Price On Next
    [Arguments]                             ${coupon_details}
    ${search_results_price}                 Set Variable                ${coupon_details}[3]
    Wait Until Element Is Visible           ${coupon_details}[1]        timeout=20s
    Press Keys                              ${None}                     ESC
    Click Element                           ${coupon_details}[1]
    Press Keys                              ${None}                     ESC
    ${present}                              Run Keyword And Return Status
    ...                                     Click Element               ${discount_link}
    ${proceed_present}                      Run Keyword And Return Status
    ...                                     Click Element               ${proceed_link}
    @{locations}	                        Get Locations
    Wait Until Keyword Succeeds             1 minutes                   30 seconds
    ...                                     Select Window               url=${locations}[1]
    ${coupon_details_price}                 Discount Details Page
    ${coupon_details_price}                 Set Variable                $${coupon_details_price}
    Close Window
    Wait Until Keyword Succeeds             1 minutes                   30 seconds
    ...                                     Select Window               url=${locations}[0]
    Press Keys                              ${None}                     ESC
    @{locations}                            Set Variable                ${None}

    Should Be Equal	                        ${search_results_price}     ${coupon_details_price}
    ...                        msg= ***Price didn't matched between the prices on search results page and coupon details page


