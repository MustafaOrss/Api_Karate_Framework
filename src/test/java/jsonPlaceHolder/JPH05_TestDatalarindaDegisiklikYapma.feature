Feature: JPH05 Kullanici disardan kullandigi JSON objelerinde degisiklik yapabilmeli

  Background:

    * def baseUrl = 'https://jsonplaceholder.typicode.com'
    * def pathParams = '/posts/70'
    * def requestBody = read ("td_requestBody.json")
    * def expectedResponseBody = read ("td_expectedResponse.json")

  @api5
  Scenario:
    Given url baseUrl
    And path pathParams
    Then set requestBody.title = 'Karate'
    And set requestBody.body = 'Framework'
    When request requestBody
    And method Put
    Then status 200
    And match header Content-Type == 'application/json; charset=utf-8'
    And match header Connection == 'keep-alive'
    And set expectedResponseBody.title = 'Karate'
    And set expectedResponseBody.body = 'Framework'
    And match response == expectedResponseBody