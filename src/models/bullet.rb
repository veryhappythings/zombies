class Bullet
  def initialize(x, y, angle)
    @image = Gosu::Image.new(RenderController.instance.window, 'media/bullet.png', false)
    @angle = angle
    @x = x
    @y = y

    RenderController.instance.register(self)
    SceneController.instance.register(self)
    ActionController.instance.register(self)
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end

  def update(dt)
    @x += Gosu::offset_x(@angle, 100) * dt
    @y += Gosu::offset_y(@angle, 100) * dt

    if @x > RenderController.instance.window.width or @y > RenderController.instance.window.height or @x < 0 or @y < 0
      destroy!
    end
  end

  def destroy!
    RenderController.instance.deregister(self)
    ActionController.instance.deregister(self)
    SceneController.instance.deregister(self)
  end
end
