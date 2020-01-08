*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections



*** Variables ***
${Base_URL}    https://reqres.in
${S_id}     2


*** Test Cases ***
TC_003 Get Request with Params
    create session  Get_st    ${Base_URL}
    &{parameters}=  create dictionary  page=2
    ${Response}=  get request   Get_st    /api/users  params=${parameters}
    log to console  ${Response.content}
    log to console  ${Response.status_code}

#    ${json_resp}=  to json  ${Response.content}
#    @{first_name_list}=  get value from json  ${json_resp}  data.first_name
#    ${first_name}=  get from list  ${first_name_list}  0
#    log to console  ${first_name}
#    should be equal  ${first_name}  Test Student
#
#
#




