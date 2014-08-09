Feature: Authentication

	Scenario: Test for access log in page
		When I access to page "/admin"
		Then I see the title "Log in | Django site admin"

    Scenario: See the log in form
		Given I access to page "/admin"
		Then I see the log in form

    Scenario: Log in and out
        Given I access to page "/admin"
        Then I see the log in form
        And fill the form:
			| name     | value |
			| username | malik |
			| password | pass  |
        And I click on the element by css-selector ".submit-row input"
        Then I see the text "malik" by id "user-tools"
        And I click on the link "Log out"

    Scenario: Log out
		When I log in
		And I click on the link "Log out"
        Then I see the text "Logged out" by id "content"
        And I see the links:
			| name   	   |
			| Home         |
			| Log in again |

	Scenario: Log in with the empty data
		Given I access to page "/admin"
		Then I see the log in form
		And I click on the element by css-selector ".submit-row input"
		Then I see the text "This field is required" by id "content"

	Scenario: Log in with the incorrect value
		Given I access to page "/admin"
		Then I see the log in form
		And fill the form:
			| name     | value  |
			| username | blabla |
			| password | blabla |
		And I click on the element by css-selector ".submit-row input"
		Then I see the text "Please enter the correct username and password" by id "content"
