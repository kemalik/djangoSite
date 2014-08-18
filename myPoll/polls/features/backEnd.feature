#language:ru
Функционал: Publishing polls

    Сценарий: Exists polls link in admin page
        Если I log in
        И I see the link "Polls"

    Сценарий: Add new poll
        Допустим I log in
        Если I add poll "New poll"

	Сценарий: Delete poll
	    Допустим I log in
	    Если I add poll "For delete"
	    И I click on the links:
            | name       |
            | For delete |
            | Delete     |
        И I click on the element by css-selector "form div input[type="submit"]"
        То I see the text "The poll "For delete" was deleted successfully" by css-path ".success"

    Сценарий: Change poll
        Допустим I log in
	    Если I add poll "For change"
	    И I click on the link "For change"
	    И fill the form:
			| name                     | value    |
			| question                 | -changed |
			| choice_set-1-choice_text | -nth     |
        И I click element by name "choice_set-0-DELETE"
        И I click element by name "_save"
        То I see the text "The poll "For change-changed" was changed successfully" by css-path ".success"