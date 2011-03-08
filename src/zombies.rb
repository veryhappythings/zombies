require 'singleton'

require 'rubygems'
require 'gosu'

dir = File.dirname(__FILE__)
require "#{dir}/lib/event"
require "#{dir}/lib/renderable"
require "#{dir}/lib/state"
require "#{dir}/lib/point"

require "#{dir}/controllers/keyboard_controller"
require "#{dir}/controllers/scene_controller"
require "#{dir}/controllers/states/menu_state"
require "#{dir}/controllers/states/playing_state"

require "#{dir}/models/player"
require "#{dir}/models/zombie"
require "#{dir}/models/bullet"
require "#{dir}/models/level"
require "#{dir}/models/invisible_wall"

require "#{dir}/views/window"
