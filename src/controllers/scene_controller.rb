# The SceneController knows about everything that is going on
# in the scene. If anything wants to know what's in the scene,
# it should ask here. Also handles rendering and updating.
class SceneController
  attr_accessor :window, :objects

  ZOMBIE_COUNT = 2

  def initialize(state)
    @objects = []
    @state = state
    @window = @state.window
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

  def update(dt)
    @objects.each do |object|
      object.update(dt)
    end

    # Should this be here?
    zombies = @objects.select {|o| o.class == Zombie}
    if zombies.length < ZOMBIE_COUNT
      Zombie.new(@state, rand*@window.width, rand*@window.height, 0)
    end
  end
end
