@parabank_transfer
Feature: Transfer to Parabank

  Background:
    * url baseUrl
    * header Accept = 'application/json'
    * def accountFrom = 26442
    * def accountTo = 34101
    * def amount = 100

  Scenario: Customer Transfer
      Given path 'transfer'
      And param fromAccountId = accountFrom
      And param toAccountId = accountTo
      And param amount = amount
      When method POST
      Then status 200
      And match response contains 'Successfully transferred'
