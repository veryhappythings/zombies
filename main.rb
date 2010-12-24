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
  include Singleton

  def initialize
    super(640, 480, false)
    self.caption = "Zombies etc"

    # State setup
    @state_stack = []
    @state_stack << PlayingState.new(self)

    @current_time = Gosu::milliseconds
  end

  # State handling
  def current_game_state
    @state_stack.last
  end

  def enter_state(state)
    @state_stack << state
  end

  def pop_state
    @state_stack.delete @state_stack.last
  end

  # Game loop
  def button_down(id)
    current_game_state.button_down(id)
  end

  def update
    dt = (Gosu::milliseconds - @current_time) / 1000.0
    @current_time = Gosu::milliseconds

    current_game_state.update(dt)
  end

  def draw
    current_game_state.draw
  end
end

window = GameWindow.instance
window.show

