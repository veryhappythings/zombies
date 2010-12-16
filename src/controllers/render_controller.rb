class RenderController
  include Singleton

  attr_accessor :window

  def initialize
    @objects = []
    @window = nil
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
