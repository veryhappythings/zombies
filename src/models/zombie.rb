class Zombie < Renderable
  SPEED = 50

  def initialize(state, x, y, angle)
    @state = state
    @window = @state.window
    @image = Gosu::Image.new(@window, 'media/zombie.png', false)
    @x = x
    @y = y
    @angle = angle
    @state.scene_controller.register(self)
  end
  def warp(x, y)
    @x, @y = x, y
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end

  def move(dt)
    @x += Gosu::offset_x(@angle, SPEED) * dt
    @y += Gosu::offset_y(@angle, SPEED) * dt
  end

  def update(dt)
    player = @state.scene_controller.player
    if player
      target_x, target_y = player.x, player.y
      @angle = Gosu::angle(@x, @y, target_x, target_y)
      move(dt)
    end

    if collides_with? player
      player.destroy!
    end
  end

  def destroy!
    @state.scene_controller.deregister(self)
  end
end
