*** Settings ***
Documentation    Suite description
Library    SeleniumLibrary

*** Variables ***
${Browser}    Chrome
${URL}    https://thetestingworld.com/testings

*** Test Cases ***
TC_001 Browser Start and Close
    open browser    ${URL}    ${Browser}


