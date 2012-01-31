Feature: deploy
  In order to quickly and easily deploy valuable services
  As a developer familiar with Capistrano
  I want to deploy services to CloudFoundry using Capistrano

  Background: Create an application
    Given a test application

  @mechanize
  Scenario: New deployment
    And no test application deployed
    When I deploy a version 1 test application
    And I visit the test application home page
    Then I expect to see "Hello World v1"

  @mechanize
  Scenario: Repeat deployment
    And a deployed test application
    When I deploy a version 2 test application
    And I visit the test application home page
    Then I expect to see "Hello World v2"
    
  @mechanize
  Scenario: Broken deployment
    And a deployed test application
    When I deploy a version 3 test application
    And I deploy a broken version 4 test application
    And I visit the test application home page
    Then I expect to see "Hello World v3"
