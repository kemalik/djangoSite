Feature: Publishing polls

    Scenario: Exists polls link in admin page
        When I log in
        And I see the link "Polls"

    Scenario: Add new poll
        Given I log in
        And I click on the links:
            | name  |
            | Polls |
            | Add   |
            | Show  |
            | Today |
            | Now   |
        And fill the form:
			| name                     | value  |
			| question                 | Test ? |
			| choice_set-0-choice_text | first  |
			| choice_set-1-choice_text | second |
		And I click element by name "_save"
		Then I see the text "The poll "Test ?" was added successfully" by css-path ".success"