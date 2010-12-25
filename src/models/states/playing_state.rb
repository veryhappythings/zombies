class PlayingState
  attr_reader :window, :render_controller, :keyboard_controller
  attr_reader :action_controller, :scene_controller

  def initialize(window)
    @window = window

    @keyboard_controller = KeyboardController.new(@window)
    @scene_controller = SceneController.new(@window)

    @player = Player.new(self)
    @player.warp(200, 200)

    @zombie = Zombie.new(self, 100, 100, 0)
    @zombie = Zombie.new(self, 550, 300, 0)
  end

  def draw
    @scene_controller.draw
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
        GameWindow.instance.enter_state MenuState.new(@window)
    end
  end
end
