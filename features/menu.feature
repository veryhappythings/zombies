Feature: Menu
        In order to control the game better
        As a new player
        I want a menu that provides me options

        Scenario: Start a game
                Given that I have a menu up
                And I have selected "new game"
                When I press "Return"
                Then I should be playing the game

        Scenario: Quit the game
                Given that I have a menu up
                And I have selected "quit"
                When I press "Return"
                Then the window should close

        Scenario: Resume the game
                Given that I am playing a game
                And I have brought up the menu
                And I have selected "resume"
                When I press "Return"
                Then I should be playing the game
