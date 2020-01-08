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
    ${Response}=  get request   Get_st    api/studentsDetails/${S_id}
    ${json_resp}=  to json  ${Response.content}
    @{first_name_list}=  get value from json  ${json_resp}  data.first_name
    ${first_name}=  get from list  ${first_name_list}  0
    log to console  ${first_name}
    should be equal  ${first_name}  Test Student







