*** Settings ***
Documentation       ACME Login

# Libraries for Browser and Excel
Library    RPA.Browser
Library    RPA.Excel.Files


# variables to store the value or intialize the values
*** Variables ***
${inputExcel}      ACME Login Details.xlsx
${sheetName}       ACME Login
${acmeLoginUrl}     https://acme-test.uipath.com/login


*** Keywords ***
# Enters Username and Password
Enter Username and Password

   # opens workbook
   Open Workbook    ${inputExcel}

   # Reads the workbook and store it in the datatable
   ${dataTable}=   Read Worksheet   ${sheetName}    True

   # Iterating through each row from the datatable list
   FOR    ${eachRow}    IN    @{dataTable}
       Log    ${eachRow}[Username]
       Log    ${eachRow}[Password]
       Log To Console    ${eachRow}[Username]
       Log To Console    ${eachRow}[Password]

       # typing username and password    
       Input Text    id=email    ${eachRow}[Username]
       Input Text    id=password    ${eachRow}[Password]
       
   END
   


# Task to be executed to login into ACME
*** Tasks ***
# Opens ACME Login Browser
Open Browser
   Open Available Browser  ${acmeLoginUrl}      maximized=True

#calls the keyword "Enter Username and Password"
Giving input
   Enter Username and Password

# clicks Login Button
Click Login
    Click Button    Login
   
   


   
   