class Renderable
  attr_reader :x, :y

  def width
    @image.width
  end

  def height
    @image.height
  end

  def top
    @y - height / 2
  end

  def bottom
    @y + height / 2
  end

  def left
    @x - width / 2
  end

  def right
    @x + width / 2
  end

  def draw
  end

  def update(dt)
  end

  def collides_with?(renderable)
    if not renderable.kind_of?(Renderable)
      false
    else
      !(bottom < renderable.top ||
        top > renderable.bottom ||
        right < renderable.left ||
        left > renderable.right)
    end
  end

end
