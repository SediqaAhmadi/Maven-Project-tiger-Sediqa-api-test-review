@EndToEnd
Feature: Automate to end to end

  #Automated an end to end scenario of
  #Generate Token
  ##Creating new account.
  #Adding address to the account.
  #Adding phone number to account
  #Adding car to account
  Background: 
    Given url "https://tek-insurance-api.azurewebsites.net/"
    And path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    And print response
    * def createdToken = response.token

  Scenario: Creating new account, add address into it,phone, and car into it.d
    Given path "/api/accounts/add-primary-account"
    * def getData = Java.type('tiger.api.fakeData.review.FakeDataReview')
    * def email = getData.getEmil()
    * def name = getData.getName()
    * def lastName = getData.getLastName()
    * def title = getData.getTitle()
    * def dob = getData.getDob()
    * def phoneNumber = getData.getPhone()
    * def extension = getData.getExtention()
    * def stAddress = getData.getStreetAddress()
    * def city = getData.getCityName()
    * def state = getData.getStateName()
    * def zipCode = getData.getPostalCode()
    And request
      """
      {
        "email": "#(email)",
        "firstName": "#(name)",
        "lastName": "#(lastName)",
        "title": "#(title)",
        "gender": "FEMALE",
        "maritalStatus": "SINGLE",
        "employmentStatus": "Empolyed",
        "dateOfBirth": "#(dob)",
        "new": true
      }
      """
    And header Authorization = "Bearer " + createdToken
    When method post
    Then status 201
    And print response
    * def dynamicId = response.id
    * def expectedResult = response.email
    Then assert expectedResult == email
    #Adding phone to the account.
    And path "/api/accounts/add-account-phone"
    And param primaryPersonId = dynamicId
    And request
      """
      {
        "phoneNumber": "#(phoneNumber)",
        "phoneExtension": "#(extention)",
        "phoneTime": "Any Time",
        "phoneType": "Mobile"
      }
      """
    And header Authorization = "Bearer " + createdToken
    When method post
    Then status 201
    And print response
    #Adding Phone
    And path "/api/accounts/add-account-address"
    And param primaryPersonId = dynamicId
    And request
      """
      {
        "addressType": "Home",
        "addressLine1": "#(stAddress)",
        "city": "#(city)",
        "state": "#(state)",
        "postalCode": "#(zipCode)",
         "current": true
      }
      """
    And header Authorization = "Bearer " + createdToken
    When method post
    Then status 201
    And print response
    ## Adding car
    And path "/api/accounts/add-account-car"
    And param primaryPersonId = dynamicId
    And request
      """
      {
        "make": "Tesla",
        "model": "SE55",
        "year": "2023",
        "licensePlate": "5005"
      }
      """
    And header Authorization = "Bearer " + createdToken
    When method post
    Then status 201
    And print response
