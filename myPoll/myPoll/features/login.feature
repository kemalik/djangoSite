Feature: Authentication

    Scenario: Test for access log in page
		When I access to page "/admin"
		Then I see the title "Log in | Django site admin"

	Scenario: Log in with the empty data
		Given I access to page "/admin"
		And I click on the button by css ".submit-row input"
		Then I should see text "This field is required" by id "content"