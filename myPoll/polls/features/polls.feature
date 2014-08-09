Feature: Publishing polls

    Scenario: Exists polls link in admin page
        When I log in
        And I see the link "Polls"

    Scenario: Add new poll
        Given I log in
        When I add poll "New poll"

	Scenario: Delete poll
	    Given I log in
	    When I add poll "For delete"
	    And I click on the links:
            | name       |
            | For delete |
            | Delete     |
        And I click on the element by css-selector "form div input[type="submit"]"
        Then I see the text "The poll "For delete" was deleted successfully" by css-path ".success"

    Scenario: Change poll
        Given I log in
	    WhenI add poll "For change"
	    And I click on the link "For change"
	    And fill the form:
			| name                     | value    |
			| question                 | -changed |
			| choice_set-1-choice_text | -nth     |
        And I click element by name "choice_set-0-DELETE"
        And I click element by name "_save"
        Then I see the text "The poll "For change-changed" was changed successfully" by css-path ".success"