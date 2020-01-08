*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections



*** Variables ***
${Base_URL}    http://thetestingworldapi.com/
${original_first_name}  Hello1
${updated_first_name}  Testing1



*** Test Cases ***
TC_001 Get Request
    create session  Get_st    ${Base_URL}
    &{body}=  create dictionary  first_name=${original_first_name}  middle_name=V  last_name==World date_of_birt=10/10/2001
    ${header}=  create dictionary  Content-Type=application/json
    ${Post_Response}=  post request  Get_st    api/studentsDetails  data=&{body}  headers=${header}
    ${json_response}=  to json  ${Post_Response.content}
    @{json_list}=  get value from json  ${json_response}  id
    ${id}=  get from list  ${json_list}  0

    &{body1}=  create dictionary  id=${id}  first_name=${updated_first_name}  middle_name=V  last_name==World  date_of_birt=10/10/2001
    ${Put_Response}=  put request  Get_st  api/studentsDetails/${id}  data=&{body1}  headers=${header}
    Fetch details and validate  ${id}



    ${delete_response}=  delete request  Get_st    api/studentsDetails/${id}
    ${json_delete}=  to json  ${delete_response.content}
    @{Message}=  get value from json  ${json_delete}   status
    ${statusM}=  get from list  ${Message}  0
    should be equal  ${statusM}  true

*** Keywords ***
Fetch details and validate
    [Arguments]  ${sid}
    ${get_Response}=  get request  Get_st    api/studentsDetails/${sid}
    ${json_get_response}=  to json  ${get_Response.content}
    @{lfirst_name}=  get value from json  ${json_get_response}   data.first_name
    ${first_name}=  get from list  ${lfirst_name}  0
    should be equal  ${first_name}  ${updated_first_name}










