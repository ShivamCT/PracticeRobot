*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections



*** Variables ***
${Base_URL}    http://thetestingworldapi.com/
${S_id}     2


*** Test Cases ***
TC_001 Get Request
    create session  Get_st    ${Base_URL}
    ${Response}=  delete request  Get_st    api/studentsDetails/${S_id}
    log to console  ${Response.content}
    log to console  ${Response.status_code}







