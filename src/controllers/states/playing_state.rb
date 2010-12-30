class PlayingState
  attr_reader :window
  attr_reader :keyboard_controller
  attr_reader :scene_controller

  def initialize(window)
    @window = window

    @keyboard_controller = KeyboardController.new(self)
    @scene_controller = SceneController.new(self)

    @target = Gosu::Image.new(@window, 'media/target.png', false)

    @player = Player.new(self)
    @player.warp(400, 300)

    @level = Level.new(self)
  end

  def end_game!(score)
    @window.pop_state!
    @window.current_game_state.custom_message = "Game over! Score: #{score}"
  end

  def draw
    @scene_controller.draw
    @target.draw(@window.mouse_x, @window.mouse_y, 0)
  end

  def update(dt)
    # Controls
    @keyboard_controller.update(dt)

    # Actions
    @scene_controller.update(dt)
  end

  def button_down(id)
    case id
      when Gosu::Button::KbSpace then
        @keyboard_controller.send_event(:kb_space_down)
      when Gosu::Button::KbEscape then
        @window.enter_state MenuState.new(@window)
        @window.current_game_state.custom_message = 'Game paused!'
      when Gosu::Button::MsLeft then
        @keyboard_controller.send_event(:mouse_left_down)
    end
  end
end
