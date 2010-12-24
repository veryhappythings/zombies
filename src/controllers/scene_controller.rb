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
