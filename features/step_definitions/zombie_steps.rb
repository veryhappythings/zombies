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
  while @window.current_game_state.selected_item != item
    @window.current_game_state.button_down(Gosu::Button::KbUp)
  end
end

When /^I press return$/ do
    @window.current_game_state.button_down(Gosu::Button::KbReturn)
end

Then /^the game should start$/ do
  @window.current_game_state.class.should == PlayingState
end

