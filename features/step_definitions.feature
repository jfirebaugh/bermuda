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

  Scenario: Autocomplete steps
    When I visit the autocomplete page
    And I fill in "Tags" with "R"
    Then I should see the following completions:
      | ActionScript |
      | AppleScript  |
      | Clojure      |
      | Erlang       |
      | Fortran      |
      | Groovy       |
      | JavaScript   |
      | Perl         |
      | Ruby         |

    When I select the "Ruby" completion
    Then the "Tags" field should contain "Ruby"

  Scenario: Dialog steps
    When I visit the dialog page
    Then I should see the "Basic dialog" dialog
    And I should see "This is the default dialog" within the "Basic dialog" dialog

    When I close the "Basic dialog" dialog
    Then I should not see the "Basic dialog" dialog

    When I visit the dialog page
    And I press "Ok" within the "Basic dialog" dialog
    Then I should not see the "Basic dialog" dialog

  Scenario: Progressbar steps
    When I visit the progressbar page
    Then the progress bar should be at 37%
    Then the progress bar should be at 37 percent

  Scenario: Slider steps
    When I visit the slider page
    Then the slider should be at 0

    When I set the slider to 37
    Then the slider should be at 37

  Scenario: Tabs steps
    When I visit the tabs page
    Then I should see the following tabs:
      | Nunc tincidunt |
      | Proin dolor    |
      | Aenean lacinia |
    And the "Nunc tincidunt" tab should be active
    And the "Proin dolor" tab should not be active

    When I activate the "Proin dolor" tab
    And the "Nunc tincidunt" tab should not be active
    And the "Proin dolor" tab should be active
    And I should see "Morbi tincidunt" within the "Proin dolor" tab
