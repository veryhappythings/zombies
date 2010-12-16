class Zombie
  def initialize(x, y, angle)
    @window = RenderController.instance.window
    @image = Gosu::Image.new(@window, 'media/zombie.png', false)
    @x = x
    @y = y
    @angle = angle
    RenderController.instance.register(self)
    ActionController.instance.register(self)
  end
  def warp(x, y)
    @x, @y = x, y
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end

  def update(dt)
  end
end
