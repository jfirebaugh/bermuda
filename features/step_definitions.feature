Feature: Step definitions
  As a developer
  I want step definitions that allow me to interact with jQuery UI widgets

  Scenario: Accordion steps
    When I visit the accordion page
    Then I should see the following accordion sections:
      | Section 1 |
      | Section 2 |
      | Section 3 |
      | Section 4 |
    And the "Section 1" accordion section should be active
    And the "Section 2" accordion section should not be active

    When I activate the "Section 2" accordion section
    And the "Section 1" accordion section should not be active
    And the "Section 2" accordion section should be active
    And I should see "Sed non urna" within the "Section 2" accordion section
