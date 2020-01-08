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
    &{body}=  create dictionary  first_name=${original_first_name} middle_name=V  last_name==World date_of_birt=10/10/2001
    ${header}=  create dictionary  Content-Type=application/json
    ${Post_Response}=  post request  Get_st    api/studentsDetails/153988  data=&{body}  headers=${header}
    ${json_response}=  to json  ${Post_Response.content}
    @{json_list}=  get value from json  ${json_response}  id
    ${id}=  get from list  ${json_list}  0

    &{body1}=  create dictionary  id=${id}  first_name=${updated_first_name} middle_name=V  last_name==World  date_of_birt=10/10/2001
    ${Put_Response}=  post request  Get_st    api/studentsDetails/153988  data=&{body1}  headers=${header}
    log to console  ${Put_Response.content}
    log to console  ${Put_Response.status_code}









