class PlayingState
  attr_reader :window, :render_controller, :keyboard_controller
  attr_reader :action_controller, :scene_controller

  def initialize(window)
    @window = window
    #@render_controller = RenderController.instance
    @render_controller = RenderController.new(@window)
    @keyboard_controller = KeyboardController.instance
    @action_controller = ActionController.instance
    @scene_controller = SceneController.instance

    @player = Player.new(self)
    @player.warp(200, 200)

    @zombie = Zombie.new(self, 100, 100, 0)
    @zombie = Zombie.new(self, 550, 300, 0)
  end

  def draw
    @render_controller.draw
  end

  def update(dt)
    # Controls
    @keyboard_controller.update(dt)

    # Actions
    @action_controller.update(dt)
  end

  def button_down(id)
    case id
      when Gosu::Button::KbEscape then
        @window.close
      when Gosu::Button::KbSpace then
        KeyboardController.instance.send_event(:kb_space_down)
      when Gosu::Button::KbM then
        GameWindow.instance.enter_state MenuState.new(@window)
    end
  end
end
