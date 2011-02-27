Feature: Player Movement
        In order to get away from the zombies
        As a player
        I want to be able to move around.

        Scenario: Move upwards
                Given that I am playing a game
                When I press "W"
                Then my character should move up the screen
