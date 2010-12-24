require 'singleton'

require 'rubygems'
require 'gosu'

require 'src/lib/event'
require 'src/controllers/render_controller'
require 'src/controllers/keyboard_controller'
require 'src/controllers/action_controller'
require 'src/controllers/scene_controller'
require 'src/models/states/menu_state'
require 'src/models/states/playing_state'
require 'src/models/player'
require 'src/models/zombie'
require 'src/models/bullet'

class GameWindow < Gosu::Window
  include KeyboardActions
  include Singleton

  def initialize
    super(640, 480, false)
    self.caption = "Zombies etc"

    # Controller setup
    @render_controller = RenderController.instance
    @render_controller.window = self
    @keyboard_controller = KeyboardController.instance
    @keyboard_controller.window = self
    @action_controller = ActionController.instance
    @action_controller.window = self

    # State setup
    MenuState.instance.setup(self)

    @state_stack = []
    @state_stack << PlayingState.instance

    @current_time = Gosu::milliseconds
  end

  def update
    dt = (Gosu::milliseconds - @current_time) / 1000.0
    @current_time = Gosu::milliseconds

    @state_stack.last.update(dt)
  end

  def draw
    @state_stack.last.draw
  end
end

window = GameWindow.instance
window.show

