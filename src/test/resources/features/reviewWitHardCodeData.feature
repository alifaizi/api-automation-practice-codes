Feature: Creating new account and adding address and phone and car in the new account

  Scenario: Creating new account and adding address, phone number, and car
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    And print response
    * def generateToken = response.token
    And print generateToken

    Given path "/api/accounts/add-primary-account"
    And request
      """
      {
      "email": "Madiha.Faizi@tekschool.com", 
      "title": "Mr.", 
      "firstName": "Madu)", 
      "lastName": "Faizi", 
      "gender": "FEMALE", 
      "maritalStatus": "SINGLE", 
      "employmentStatus": "Student", 
      "dateOfBirth": "2011-09-30T23:16:41.471Z", 
      "new": true
      }
      """
    And header Authorization = "Bearer " + generateToken
    When method post
    Then status 201
    * def generatedId = response.id
    And print response
    
    Given path "/api/accounts/add-account-address"
    And header Authorization = "Bearer " + generateToken
    And param primaryPersonId = generatedId
    And request
      """
      {
      "addressType": "Home",
      "addressLine1": "5050 Here Drive",
      "city": "There",
      "state": "Here and There",
      "postalCode": "11111",
      "current": true
      }
      """
    When method post
    Then status 201
    And print response
    
    Given path "/api/accounts/add-account-phone"
    And header Authorization = "Bearer " + generateToken
    And param primaryPersonId = generatedId
    And request
      """
      {
      "phoneNumber": "202-101-1010",
      "phoneExtension": "1010",
      "phoneTime": "Any Time",
      "phoneType": "Mobile"
      }
      """
    When method post
    Then status 201
    And print response
    Given path "/api/accounts/add-account-car"
    And header Authorization = "Bearer " + generateToken
    And param primaryPersonId = generatedId
    And request
      """
      {
      "make": "Hunda",
      "model": "CIvic",
      "year": "2022",
      "licensePlate": "XYZ1010"
      }
      """
    When method post
    Then status 201
    And print response