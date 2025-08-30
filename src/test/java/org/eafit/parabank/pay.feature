@parabank_pay
Feature: Pay to Parabank

  Background:
    * url baseUrl
    * header Accept = 'application/json'
    * def accountId = 19671
    * def amount = 100
    * def name = 'pruebas karate'
    * def street = 'cra 12 45'
    * def city = 'medellin'
    * def state = 'antioquia'
    * def zipCode = '2334567'
    * def phoneNumber = '34567892'
    * def accountNumber = 21003

  Scenario: Customer Pay
      Given path 'billpay'
      And param accountId = accountId
      And param amount = amount
      And request
    """
    {
      "name": "#(name)",
      "address": {
        "street": "#(street)",
        "city": "#(city)",
        "state": "#(state)",
        "zipCode": "#(zipCode)"
      },
      "phoneNumber": "#(phoneNumber)",
      "accountNumber": #(accountNumber),
    }
    """
      When method POST
      Then status 200
      And match response == """ { "payeeName": "prueba karate", "amount": 100, "accountId": 19671 } """

