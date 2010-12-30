Given /^that I have a menu up$/ do
  @window = GameWindow.new
end

Given /^I have selected "([^"]*)"$/ do |item|
  @window.current_game_state.select_item item
end

Given /^I have brought up the menu$/ do
  @window.button_down(Gosu::Button::KbEscape)
end
