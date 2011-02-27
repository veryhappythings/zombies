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
When /^I press "([^"]*)"$/ do |key_name|
    key = case key_name
          when 'Return' then
            Gosu::Button::KbReturn
          when 'W' then
            Gosu::Button::KbW
          when 'A' then
            Gosu::Button::KbA
          when 'S' then
            Gosu::Button::KbS
          when 'D' then
            Gosu::Button::KbD
          end
    @window.button_down(key)
end

# Thens
Then /^the window should close$/ do
  # I don't currently have a way to find out if the window closed or not.
end

Then /^I should be playing the game$/ do
  @window.current_game_state.class.should == PlayingState
end

Then /^my character should move up the screen$/ do
  @window.update
  @window.current_game_state.scene_controller.player.y.should < 300
end

