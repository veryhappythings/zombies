# The ActionController tells everything to update.
# If something needs to update, it should register here.
class ActionController
  attr_accessor :window

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

  def update(dt)
    @objects.each do |object|
      object.update(dt)
    end
  end
end
