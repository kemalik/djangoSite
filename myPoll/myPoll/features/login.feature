Feature: Open log in page

    Scenario: Test access
		When I access to page "/admin"
		Then I see the title "Log in | Django site admin"