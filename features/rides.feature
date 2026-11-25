Feature: Search Rides by Area
  As a user
  I want to search for rides by area
  So that I can find rides available in my preferred area

  Scenario: Successfully search for rides in an area
    Given there are available rides in "Nasr City"
    When the user searches for rides in "Nasr City"
    Then the system displays rides available in "Nasr City"

  Scenario: No rides available in the selected area
    Given there are no available rides in "Maadi"
    When the user searches for rides in "Maadi"
    Then the system displays "No rides found"

  Scenario Outline: Search using different area names
    Given there are available rides in "<area>"
    When the user searches for rides in "<area>"
    Then the system displays rides available in "<area>"

    Examples:
      | area      |
      | Nasr City |
      | Maadi     |