class Level
  ZOMBIE_COUNT = 2

  def initialize(state)
    @state = state
    @window = @state.window

    @state.scene_controller.register(self)
  end

  def draw
  end

  def update(dt)
    zombies = @state.scene_controller.objects.select {|o| o.class == Zombie}
    if zombies.length < ZOMBIE_COUNT
      Zombie.new(@state, rand*@window.width, rand*@window.height, 0)
    end
  end
end
