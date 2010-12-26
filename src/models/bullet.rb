class Bullet < Renderable
  SPEED = 200

  def initialize(state, x, y, angle)
    @state = state
    @image = Gosu::Image.new(@state.window, 'media/bullet.png', false)
    @angle = angle
    @x = x
    @y = y

    @state.scene_controller.register(self)
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end

  def update(dt)
    @x += Gosu::offset_x(@angle, SPEED) * dt
    @y += Gosu::offset_y(@angle, SPEED) * dt

    # TODO: Collision detection
    if @x > @state.window.width or @y > @state.window.height or @x < 0 or @y < 0
      destroy!
    end

    @state.scene_controller.objects.each do |object|
      if collides_with? object
        if object.class == Zombie
          object.destroy!
          destroy!
        end
      end
    end
  end

  def destroy!
    @state.scene_controller.deregister(self)
  end
end
