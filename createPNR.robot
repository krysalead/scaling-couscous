*** Settings ***
Library           RequestsLibrary

*** Variables ***
${url}            http://api.ipstack.com/

*** Test Cases ***
Get cooking video
    Create Session    ipstack    ${url}
    ${resp}=    Get Request    ipstack    176.152.216.201?access_key=60a4c160ff3d3ac6391d6ce8dd1d85f0&format=1
    Should Be Equal As Strings    ${resp.status_code}    200
    ${jsondata}=    To Json    ${resp.content}
    Should Be Equal As Strings    ${jsondata['country_name']}    France
