class Player < Renderable
  SPEED = 100

  attr_reader :score

  def initialize(state)
    @state = state
    @window = state.window
    @image = Gosu::Image.new(@window, 'media/player.png', false)
    @x = @y = @angle = 0.0

    @health = 100
    @score = 0

    @state.keyboard_controller.register(self)
    @state.scene_controller.register(self)
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end

  def update(dt)
    if @health <= 0
      destroy!
    end
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
    when :game_killed_zombie then
      @score += 1
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
    # TODO: Move wall collision calculations into physics model
    x_movement = Gosu::offset_x(@angle, SPEED*direction) * dt
    y_movement = Gosu::offset_y(@angle, SPEED*direction) * dt

    if x_movement > 0 and @x < @state.window.width - width/2
      @x += x_movement
    elsif x_movement < 0 and @x > 0 + width/2
      @x += x_movement
    end

    if y_movement > 0 and @y < @state.window.height - height/2
      @y += y_movement
    elsif y_movement < 0 and @y > 0 + height/2
      @y += y_movement
    end
  end

  def shoot
    bullet = Bullet.new(@state, @x, @y, @angle, self)
  end

  def destroy!
    @state.end_game! @score
  end

  def damage(value)
    @health -= value
  end
end
