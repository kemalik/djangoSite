#language:ru

Функционал: Client side of polls

    Сценарий: Add new poll and check for published
        Допустим I log in
        И I see the link "Polls"
        И I add poll "Red or Blue?"
        Допустим I access to page "/polls"
        И I see the link "Red or Blue?"

    Сценарий: Delete poll and check in client side
        Допустим I log in
        И I add poll "Will be deleted?"
        И I access to page "/polls"
        И I see the link "Will be deleted?"
        И I access to page "/admin"
        И I click on the links:
            | name             |
            | Will be deleted? |
            | Delete           |
        И I click on the element by css-selector "form div input[type="submit"]"
        И I access to page "/polls"
        То I do not see the text "Will be deleted?"

    Сценарий: Exist back link when click vote
        Допустим I log in
        И I add poll "Test back link"
        И I access to page "/polls"
        И click on the link "Test back link"
        И click element by name "choice"
        И I click on the element by css-selector "form input[type="submit"]"
        То I see the link "Vote again?"


    Сценарий: Exist error when variant not choice
        Допустим I log in
        И I add poll "Test error msg"
        И I access to page "/polls"
        И click on the link "Test error msg"
        И I click on the element by css-selector "form input[type="submit"]"
        То I see the text "You didn't select a choice" by css-path "body p"'
