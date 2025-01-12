*** Settings ***
Library    OperatingSystem    
Library    Collections
Library    Process
Documentation   A test suite validating document generation scripts
Test Setup    Setup Test Environment

*** Variables ***
${PROJECT_PATH}    ${CURDIR}/../..
${TEMPLATES_PATH}    ${PROJECT_PATH}/.mise/templates
${TMP_DIRECTORY}    ${PROJECT_PATH}/output/tmp
${OUTPUT_DIR}    ${PROJECT_PATH}/output
${TEST_DATA_DIR}    ${CURDIR}/testdata
${WORKING_DIR}    

*** Test Cases ***
Generate new root Readme.md
    Given a file template "${PROJECT_PATH}/.mise/templates/readme.md.tmpl"
    When user runs mise task "gen:docs" in "${WORKING_DIR}"
    Then file "${WORKING_DIR}/README.md" should match "${TEST_DATA_DIR}/WantReadme.md"
    
Overwrite existing root Readme.md
    Given a file template "${PROJECT_PATH}/.mise/templates/readme.md.tmpl"
    and a dummy file at "${WORKING_DIR}/README.md"
    When user runs mise task "gen:docs" in "${WORKING_DIR}"
    Then file "${WORKING_DIR}/README.md" should match "${TEST_DATA_DIR}/WantReadme.md"

***Keywords***
A file template "${path}"
    File Should Exist    ${path}

A dummy file at "${path}"
    Create File    ${path}

User runs mise task "${task}" in "${dir}"
    Log to console    \nUser runs mise task "${task}"
    ${want} =     Catenate    SEPARATOR=\n
    ...    Generating documentation...
    ...    Found 1 module(s): [bg3vcs]
    ...    Generating README.md...
    ...    Generated README.md

    Log to console    Output dir "${dir}"
    ${got} =     Run Process    mise    run    ${task}    --dir    ${WORKING_DIR}    --output-dir    ${OUTPUT_DIR}    cwd=${dir}
    Should Be Equal As Integers    ${got.rc}    0
    Should Be Equal As Strings    ${got.stdout}    ${want}
    Should Be Empty    ${got.stderr}    

File "${got}" should match "${want}"
    Log to console    \nFile "${got}" should match "${want}"
    File Should Exist    ${got}
    File Should Exist    ${want}
    File Should Match    ${got}    ${want}

Setup test environment
    [Documentation]    Cleans up previous test runs and creates a space for each test to run in isolation
    Log To Console    \nCleaning up previous test runs
    Empty Directory    ${TMP_DIRECTORY}
    Log To Console    Creating a space for each test to run in isolation
    ${tmp_path} =     Evaluate    uuid.uuid4()
    Set Test Variable    ${WORKING_DIR}    ${PROJECT_PATH}/output/tmp/${tmp_path}
    Create Directory    ${WORKING_DIR}
    Log To Console    Created Temporary Directory ${WORKING_DIR}