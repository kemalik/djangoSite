Feature: Publishing polls

    Scenario: Exists polls link in admin page
        When I log in
        And I see the link "Polls"

    Scenario: Add new poll
        Given I log in
        And I click on the link "Polls"
        And I click on the link "Add"
        And I click on the link "Show"
        And I click on the link "Today"
        And I click on the link "Now"
        And fill the form:
			| name                     | value  |
			| question                 | Test ? |
			| choice_set-0-choice_text | first  |
			| choice_set-1-choice_text | second |
		And I click element by name "_save"
		Then I see the text "The poll "Test ?" was added successfully" by css-path ".success"