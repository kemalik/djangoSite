Feature: Publishing polls

    Scenario: Exists polls link in admin page
        When I log in
        And I see the link "Polls"

    Scenario: Add new poll
        Given I log in
        I add poll "New poll"

	Scenario: Delete poll
	    Given I log in
	    I add poll "For delete"
	    And I click on the links:
            | name   |
            | Polls  |
            | Change |
            | Test ? |
            | Delete |
        And I click on the element by css-selector "form div input[type="submit"]"
        Then I see the text "The poll "Test ?" was deleted successfully" by css-path ".success"