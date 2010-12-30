require 'rspec/expectations'
require 'src/zombies'

Before do
  @window = GameWindow.new
end

After do
end

# Givens

Given /^that I am playing a game$/ do
  @window.new_game!
end

# Whens
When /^I press return$/ do
    @window.current_game_state.button_down(Gosu::Button::KbReturn)
end

# Thens
Then /^the window should close$/ do
  # I don't currently have a way to find out if the window closed or not.
end

Then /^I should be playing the game$/ do
  @window.current_game_state.class.should == PlayingState
end

