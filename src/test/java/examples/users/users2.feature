Feature: Checking the JSON response

  Background: 
    * url 'https://reqres.in/'

  Scenario: 
    Given path 'api/users'
    And param page = 1
    When method GET
    Then status 200 
    And print 'response : \n',response
    And match responseStatus == 200
    And match response.page == '#? _ == 1'
    And match response.data == '#[6]'
    And match response.data[*].id == [1,2,3,4,5,6]
   * karate.log('\nemail :'+ response.data[0].email)
   # And match response.data[*].email == '#regex[a-z]|.|\\@reqres.in'
    And match response.data[0] contains { email: '#string'}
   # And match response.data[0] contains { first_name: '#regex[A-Z][a-z]' }
    And match response.data[0] contains { first_name: '#string' }
