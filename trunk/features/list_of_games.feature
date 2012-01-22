Feature: List of games
  To see new awesome games
  As a logged user
  I pressing games link

  Scenario: Viewing games
  Given I am logged
  When I press 'games' link
  Then I should see 'games/'