@Smoke
Feature: Authentication Smoke Test

Scenario: generate token with valid username and password
Given url "https://tek-insurance-api.azurewebsites.net"
And path "/api/token"
And request {"username": "supervisor","password": "tek_supervisor"}
When method post
Then status 200
And print response.token

Scenario: generate token with invalid username and password
Given url "https://tek-insurance-api.azurewebsites.net"
And path "/api/token"
And request {"username": "supervisorxyz","password": "tek_supervisor"}
When method post
Then status 404
And print response
* def errorMessage = response.errorMessage
And assert errorMessage == "USER_NOT_FOUND"