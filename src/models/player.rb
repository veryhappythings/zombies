
class Player
  attr_reader :x, :y

  def initialize(state)
    @state = state
    @window = state.window
    @image = Gosu::Image.new(@window, 'media/player.png', false)
    @x = @y = @angle = 0.0

    @state.render_controller.register(self)
    @state.keyboard_controller.register(self)
    @state.scene_controller.register(self)
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end

  def handle_event(event)
    case event.name
    when :kb_left_down then
      turn_left(event.options[:dt])
    when :kb_right_down then
      turn_right(event.options[:dt])
    when :kb_up_down then
      move_forwards(event.options[:dt])
    when :kb_down_down then
      move_backwards(event.options[:dt])
    when :kb_space_down then
      shoot
    end
  end

  def turn_left(dt)
    @angle -= 90 * dt
  end

  def turn_right(dt)
    @angle += 90 * dt
  end

  def move_forwards(dt)
    move(dt, 1)
  end
  def move_backwards(dt)
    move(dt, -1)
  end
  def move(dt, direction)
    @x += Gosu::offset_x(@angle, 100*direction) * dt
    @y += Gosu::offset_y(@angle, 100*direction) * dt
    @x %= @state.window.width
    @y %= @state.window.height
  end

  def shoot
    bullet = Bullet.new(@state, @x, @y, @angle)
  end
end
