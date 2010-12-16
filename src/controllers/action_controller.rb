class ActionController
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

  def update(dt)
    @objects.each do |object|
      object.update(dt)
    end
  end
end
