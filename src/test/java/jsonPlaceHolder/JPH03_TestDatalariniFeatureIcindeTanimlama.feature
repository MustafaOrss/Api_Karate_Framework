Feature: JPH03 Kullanici Test datalarini Feature icinde Testten once tanimlayabilmeli
  Background:
    * def baseUrl = 'https://jsonplaceholder.typicode.com'
    * def pathParams = '/posts/70'
    * def requestBody =
    """
    {
    "id": 70,
    "title": "Ahmet",
    "body": "Merhaba",
    "userId": 10
    }
    """

    * def expectedResponseBody =
    """
    {
    "id": 70,
    "title": "Ahmet",
    "body": "Merhaba",
    "userId": 10
    }
    """

  Scenario:
    Given url  baseUrl
    And path  pathParams
    When request requestBody
    And method Put
    Then status 200
    And match header Content-Type == 'application/json; charset=utf-8'
    And match header Connection == 'keep-alive'

    And match response == expectedResponseBody




