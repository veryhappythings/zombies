class Renderable
  attr_reader :x, :y

  def width
    @image.width
  end

  def height
    @image.height
  end

  def draw
  end

  def update(dt)
  end
end
