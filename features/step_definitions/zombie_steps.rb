require 'rspec/expectations'
require 'src/zombies'

Before do
  @window = GameWindow.new
end

After do
end

Given /^that I have a menu up$/ do
  @window = GameWindow.new
end

Given /^I have selected "([^"]*)"$/ do |item|
  @window.current_game_state.select_item item
end

When /^I press return$/ do
    @window.current_game_state.button_down(Gosu::Button::KbReturn)
end

Then /^the game should start$/ do
  @window.current_game_state.class.should == PlayingState
end

Then /^the window should close$/ do
  # I don't currently have a way to find out if the window closed or not.
end

