require 'rspec/expectations'
require 'src/zombies'

Before do
  @window = GameWindow.new
end

After do
end

# Givens
Given /^that I have a menu up$/ do
  @window = GameWindow.new
end

Given /^I have selected "([^"]*)"$/ do |item|
  @window.current_game_state.select_item item
end

Given /^that I am playing a game$/ do
  @window.new_game!
end

Given /^I have brought up the menu$/ do
  @window.button_down(Gosu::Button::KbEscape)
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

