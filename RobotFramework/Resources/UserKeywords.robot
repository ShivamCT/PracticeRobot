*** Settings ***
Documentation    Suite description in Keywords
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Library  ../Python/ReadContent.py


*** Variables ***
${Base_URL}    http://thetestingworldapi.com/

*** Keywords ***
Fetch details and validate
    [Arguments]  ${sid}
    [Documentation]  This is in keyword
    [Timeout]  2s
    create session  Get_st    ${Base_URL}
    ${get_Response}=  get request  Get_st    api/studentsDetails/${sid}
    ${json_get_response}=  to json  ${get_Response.content}
    @{lfirst_name}=  get value from json  ${json_get_response}   data.first_name
    ${first_name}=  get from list  ${lfirst_name}  0
    should be equal  ${first_name}  ${updated_first_name}

Fetch read Content
    ${jsonbody}=  read file content1
    [Return]  ${jsonbody}

Welcome Statement
    [Documentation]  Welcome here
    log to console  Starting of Testcases

End Here
    [Documentation]  Ended here
    log to console  Testcases end here
