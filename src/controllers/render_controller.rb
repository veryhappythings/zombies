class RenderController
  attr_reader :window

  def initialize(window)
    @objects = []
    @window = window
  end

  def register(object)
    @objects << object
  end

  def deregister(object)
    @objects.delete object
  end

  def draw
    @objects.each do |object|
      object.draw
    end
  end
end
