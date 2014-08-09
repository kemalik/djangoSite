Feature: Change password

	Scenario: Check password form
		Given open password change page
		Then I see the password form

	Scenario: Change and revert pass
		Given open password change page
		Then I see the password form
		And fill the form:
			| name          | value      |
			| old_password  | pass       |
			| new_password1 | password   |
			| new_password2 | password   |
		And I click on the element by css-selector ".submit-row input"
		Then I see the text "Password change successful" by css-path ".colM h1"
		And I click on the link "Home"
		And I click on the link "Change password"
		And fill the form:
			| name          | value    |
			| old_password  | password |
			| new_password1 | pass     |
			| new_password2 | pass     |
		And I click on the element by css-selector ".submit-row input"
		Then I see the text "Password change successful" by css-path ".colM h1"

	Scenario: Incorrect old password
		Given open password change page
		Then I see the password form
		And fill the form:
			| name          | value    |
			| old_password  | blabla   |
			| new_password1 | password |
			| new_password2 | password |
		And I click on the element by css-selector ".submit-row input"
		Then I see the text "Your old password was entered incorrectly" by css-path ".errorlist li"

	Scenario: Not same new passwords
		Given open password change page
		Then I see the password form
		And fill the form:
			| name          | value    |
			| old_password  | pass     |
			| new_password1 | password |
			| new_password2 | blabla   |
		And I click on the element by css-selector ".submit-row input"
		Then I see the text "The two password fields didn't match." by css-path ".errorlist li"

	Scenario: Test for empty fields
		Given open password change page
		Then I see the password form
		And I click on the element by css-selector ".submit-row input"
		Then I see the text "Please correct the errors below." by css-path ".errornote"