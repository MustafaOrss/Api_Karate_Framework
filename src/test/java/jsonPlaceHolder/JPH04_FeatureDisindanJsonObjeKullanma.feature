@api4
Feature: JPH04 Kullanici Json objesin olan test datalarini Feature disinda olusturabilmeli

  Background:

    * def baseUrl = 'https://jsonplaceholder.typicode.com'
    * def pathParams = '/posts/70'
    * def requestBody = read ("td_requestBody.json")
    * def expectedResponseBody = read ("td_expectedResponse.json")


  Scenario: TC04 disardan Json Obje kullanilabilmeli
    Given url baseUrl
    And path pathParams
    When request requestBody
    And method Put
    Then status 200
    And match header Content-Type == 'application/json; charset=utf-8'
    And match header Connection == 'keep-alive'
    And assert response.id == expectedResponseBody.id
    And assert response.title == expectedResponseBody.title
    And assert response.body == expectedResponseBody.body
    And assert response.userId == expectedResponseBody.userId