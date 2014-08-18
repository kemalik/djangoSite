#language:ru

Функионал: Change password

	Сценарий: Check password form
		Допустим open password change page
		То I see the password form

	Сценарий: Change and revert pass
		Допустим open password change page
		То I see the password form
		И fill the form:
			| name          | value      |
			| old_password  | pass       |
			| new_password1 | password   |
			| new_password2 | password   |
		И I click on the element by css-selector ".submit-row input"
		То I see the text "Password change successful" by css-path ".colM h1"
		И I click on the link "Home"
		И I click on the link "Change password"
		И fill the form:
			| name          | value    |
			| old_password  | password |
			| new_password1 | pass     |
			| new_password2 | pass     |
		И I click on the element by css-selector ".submit-row input"
		То I see the text "Password change successful" by css-path ".colM h1"

	Сценарий: Incorrect old password
		Допустим open password change page
		То I see the password form
		И fill the form:
			| name          | value    |
			| old_password  | blabla   |
			| new_password1 | password |
			| new_password2 | password |
		И I click on the element by css-selector ".submit-row input"
		То I see the text "Your old password was entered incorrectly" by css-path ".errorlist li"

	Сценарий: Not same new passwords
		Допустим open password change page
		То I see the password form
		И fill the form:
			| name          | value    |
			| old_password  | pass     |
			| new_password1 | password |
			| new_password2 | blabla   |
		И I click on the element by css-selector ".submit-row input"
		То I see the text "The two password fields didn't match." by css-path ".errorlist li"

	Сценарий: Test for empty fields
		Допустим open password change page
		То I see the password form
		И I click on the element by css-selector ".submit-row input"
		То I see the text "Please correct the errors below." by css-path ".errornote"