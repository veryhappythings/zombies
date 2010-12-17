class SceneController
  include Singleton

  attr_accessor :window, :objects

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
end
