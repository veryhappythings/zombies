# The SceneController knows about everything that is going on
# in the scene. If anything wants to know what's in the scene,
# it should ask here
class SceneController
  attr_accessor :window, :objects

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
end
