*** Settings ***
Library  RequestsLibrary



*** Variables ***
${Base_URL}    http://thetestingworldapi.com/
${S_id}     2


*** Test Cases ***
TC_001 Get Request
    create session  Get_st    ${Base_URL}
    ${response}=  get request   Get_st    api/studentsDetails/${S_id}
    log to console  ${response.status_code}
#    log to console  ${response.content}
    ${actual_code}  convert to string  ${response.status_code}
    should be equal  ${actual_code}  201





