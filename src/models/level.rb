class Level
  ZOMBIE_COUNT = 2

  def initialize(state)
    @state = state
    @window = @state.window

    @state.scene_controller.register(self)
  end

  def draw
  end

  def spawn_zombie!
    x = rand * @window.width
    y = rand * @window.height

    # TODO: Some clever math for this mess!
    possible = {
     :distance_to_left => x,
     :distance_to_right => @window.width - x,
     :distance_to_top => y,
     :distance_to_bottom => @window.height - y
    }
    lowest = :distance_to_left
    possible.each_pair do |key, value|
      if value < possible[lowest]
        lowest = key
      end
    end
    case lowest
    when :distance_to_left then
      x = 0
    when :distance_to_right then
      x = @window.width
    when :distance_to_top then
      y = 0
    when :distance_to_bottom then
      y = @window.height
    end

    Zombie.new(@state, x, y, 0)
  end

  def update(dt)
    zombies = @state.scene_controller.zombies
    if zombies.length < ZOMBIE_COUNT
      spawn_zombie!
    end
  end
end
