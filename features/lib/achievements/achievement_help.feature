Feature: Achievement help
  In order to to get help on achievements
  As a user
  I want a list of guides pertaining to a given achievement

  Scenario: Achievement help is gathered from multiple sources
    Given I have a game
    And I have an achievement for that game
    When I gather a list of help for this achievement
    Then the list should include results from xboxachievements.com
    Then the list should include results from trueachievements.com

  Scenario: Achievement help is not added to the list if it cannot be found
    Given I have a game
    And I have an achievement for that game
    And achievement help sources cannot be reached
    When I gather a list of help for this achievement
    Then the list should be empty