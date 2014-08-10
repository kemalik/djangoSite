Feature: Client side of polls

    Scenario: Add new poll and check for published
        Given I log in
        And I see the link "Polls"
        And I add poll "Red or Blue?"
        Given I access to page "/polls"
        And I see the link "Red or Blue?"

    Scenario: Delete poll and check in client side
        Given I log in
        And I add poll "Will be deleted?"
        And I access to page "/polls"
        And I see the link "Will be deleted?"
        And I access to page "/admin"
        And I click on the links:
            | name             |
            | Will be deleted? |
            | Delete           |
        And I click on the element by css-selector "form div input[type="submit"]"
        And I access to page "/polls"
        Then I do not see the text "Will be deleted?"