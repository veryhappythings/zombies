class PlayingState
  include Singleton

  def initialize
    @render_controller = RenderController.instance
    @keyboard_controller = KeyboardController.instance
    @action_controller = ActionController.instance

    @player = Player.new
    @player.warp(200, 200)

    @zombie = Zombie.new(100, 100, 0)
    @zombie = Zombie.new(550, 300, 0)
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
        close
      when Gosu::Button::KbSpace then
        KeyboardController.instance.send_event(:kb_space_down)
      when Gosu::Button::KbM then
        GameWindow.instance.enter_state MenuState.instance
    end
  end
end
