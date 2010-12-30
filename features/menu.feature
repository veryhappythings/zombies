Feature: Menu
        In order to control the game better
        As a new player
        I want a menu that provides me options

        Scenario: Start a game
                Given that I have a menu up
                And I have selected "new game"
                When I press return
                Then the game should start

        Scenario: Quit the game
                Given that I have a menu up
                And I have selected "quit"
                When I press return
                Then the window should close
