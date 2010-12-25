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

  def collides_with?(renderable)
    if not renderable.kind_of?(Renderable)
      false
    else
      @x > renderable.x - renderable.width/2 &&
        @x < renderable.x + renderable.width/2 &&
        @y > renderable.y - renderable.height/2 &&
        @y < renderable.y + renderable.height/2
    end
  end
end
