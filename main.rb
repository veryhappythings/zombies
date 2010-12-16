require 'singleton'

require 'rubygems'
require 'gosu'

require 'src/lib/event'
require 'src/controllers/render_controller'
require 'src/controllers/keyboard_controller'
require 'src/controllers/action_controller'
require 'src/models/player'
require 'src/models/zombie'
require 'src/models/bullet'

class GameWindow < Gosu::Window
  include KeyboardActions

  def initialize
    super(640, 480, false)
    self.caption = "Zombies etc"

    @render_controller = RenderController.instance
    @render_controller.window = self
    @keyboard_controller = KeyboardController.instance
    @keyboard_controller.window = self
    @action_controller = ActionController.instance
    @action_controller.window = self

    @player = Player.new
    @player.warp(200, 200)

    @zombie = Zombie.new(100, 100, 0)

    @current_time = Gosu::milliseconds
  end

  def update
    # I'm gonna use delta time physics. Bitches love delta time physics.
    dt = (Gosu::milliseconds - @current_time) / 1000.0
    @current_time = Gosu::milliseconds

    # Controls
    @keyboard_controller.update(dt)

    # Actions
    @action_controller.update(dt)
  end

  def draw
    @render_controller.draw
  end
end

window = GameWindow.new
window.show

