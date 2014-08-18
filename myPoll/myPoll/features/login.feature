#language:ru

Функционал: Authentication

	Сценарий: Test for access log in page
		Если I access to page "/admin"
		То I see the title "Log in | Django site admin"

    Сценарий: See the log in form
		Допустим I access to page "/admin"
		То I see the log in form

    Сценарий: Log in and out
        Допустим I access to page "/admin"
        То I see the log in form
        И fill the form:
			| name     | value |
			| username | malik |
			| password | pass  |
        И I click on the element by css-selector ".submit-row input"
        То I see the text "malik" by id "user-tools"
        И I click on the link "Log out"

    Сценарий: Log out
		Если I log in
		И I click on the link "Log out"
        То I see the text "Logged out" by id "content"
        И I see the links:
			| name   	   |
			| Home         |
			| Log in again |

	Сценарий: Log in with the empty data
		Допустим I access to page "/admin"
		То I see the log in form
		И I click on the element by css-selector ".submit-row input"
		То I see the text "This field is required" by id "content"

	Сценарий: Log in with the incorrect value
		Допустим I access to page "/admin"
		То I see the log in form
		И fill the form:
			| name     | value  |
			| username | blabla |
			| password | blabla |
		И I click on the element by css-selector ".submit-row input"
		То I see the text "Please enter the correct username and password" by id "content"

	Сценарий: Admin page
		Допустим I log in
		И I see the links:
			| name   		  |
			| Users  		  |
			| Groups          |
			| Change password |
			| Log out 		  |
			| Add  			  |
			| Change 		  |