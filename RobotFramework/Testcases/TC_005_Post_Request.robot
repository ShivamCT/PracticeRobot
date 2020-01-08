*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections



*** Variables ***
${Base_URL}    http://thetestingworldapi.com/


*** Test Cases ***
TC_001 Get Request
    create session  Get_st    ${Base_URL}
    &{body}=  create dictionary  first_name=Testing2 middle_name=Test4  last_name==Testing2  date_of_birt=10/10/2001
    ${header}=  create dictionary  Content-Type=application/json
    ${Response}=  post request  Get_st    api/studentsDetails/  data=&{body}  headers=${header}
    log to console  ${Response.content}
    log to console  ${Response.status_code}







