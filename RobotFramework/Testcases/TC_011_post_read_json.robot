*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Resource  ../Resources/UserKeywords.robot



*** Variables ***
${Base_URL}    http://thetestingworldapi.com/

*** Test Cases ***
TC_001 Get Request
    create session  Get_st    ${Base_URL}
    ${header}=  create dictionary  Content-Type=application/json
    ${jsonresponse}=  Fetch read Content

    ${Post_Response}=  post request  Get_st    api/studentsDetails  data=${jsonresponse}  headers=${header}
    ${code}=  convert to string  ${Post_Response.status_code}
    should be equal  ${code}  201








