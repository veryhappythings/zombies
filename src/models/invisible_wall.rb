class InvisibleWall < Renderable
  def initialize(state, top_left_x, top_left_y, bottom_right_x, bottom_right_y)
    @state = state

    @width = bottom_right_x - top_left_x
    @height = bottom_right_y - top_left_y
    @x = top_left_x + @width/2
    @y = top_left_y + @height/2

    @state.scene_controller.register(self)
  end

  def width
    @width
  end

  def height
    @height
  end
end
