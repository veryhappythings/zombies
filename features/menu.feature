Feature: Starting a game
        In order to waste some time
        As a new player
        I want to start a game

        Scenario: Start a game
                Given that I have a menu up
                And I have selected "new game"
                When I press return
                Then the game should start
