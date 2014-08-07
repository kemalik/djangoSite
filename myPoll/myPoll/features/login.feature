Feature: Authentication

    Scenario: Test for access log in page
		When I access to page "/admin"
		Then I see the title "Log in | Django site admin"

	Scenario: Log in with the empty data
		Given I access to page "/admin"
		And I click on the button by css-selector ".submit-row input"
		Then I see the text "This field is required" by id "content"

	Scenario: Log in with the incorrect value
		Given I access to page "/admin"
		When I fill the field named "username" with value "blabla"
        And I fill the field named "password" with value "blabla"
		And I click on the button by css-selector ".submit-row input"
		Then I see the text "Please enter the correct username and password" by id "content"

    Scenario: Log in and out with the correct data
        Given I access to page "/admin"
        When I fill the field named "username" with value "malik"
        And I fill the field named "password" with value "pass"
        And I click on the button by css-selector ".submit-row input"
        Then I see the text "malik" by id "user-tools"
        And I click on the link "Log out"
        Then I see the text "Logged out" by id "content"
        And I see the text "Log in again" by id "content"