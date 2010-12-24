class Bullet
  def initialize(state, x, y, angle)
    @state = state
    @image = Gosu::Image.new(@state.render_controller.window, 'media/bullet.png', false)
    @angle = angle
    @x = x
    @y = y

    @state.render_controller.register(self)
    @state.scene_controller.register(self)
    @state.action_controller.register(self)
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end

  def update(dt)
    @x += Gosu::offset_x(@angle, 100) * dt
    @y += Gosu::offset_y(@angle, 100) * dt

    if @x > @state.render_controller.window.width or @y > @state.render_controller.window.height or @x < 0 or @y < 0
      destroy!
    end
  end

  def destroy!
    @state.render_controller.deregister(self)
    @state.action_controller.deregister(self)
    @state.scene_controller.deregister(self)
  end
end
