class Level
  SPAWN_TIME = 3
  def initialize(state)
    @state = state
    @window = @state.window

    @state.scene_controller.register(self)

    @font = Gosu::Font.new(@window, Gosu::default_font_name, 20)

    @zombie_count = 2
    @time_passed = 0

    # In lieu of a map
    # left
    InvisibleWall.new(@state, -1, -1, 0, @window.height)
    # top
    InvisibleWall.new(@state, -1, -1, @window.width, 0)
    # right
    InvisibleWall.new(@state, @window.width, -1, @window.width+1, @window.height)
    # bottom
    InvisibleWall.new(@state, 0, @window.height, @window.width, @window.height+1)
  end

  def draw(camera)
    @font.draw(@state.scene_controller.player.score, 1, 1, 0)
  end

  def spawn_zombie
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
    @time_passed += dt

    if @time_passed > SPAWN_TIME
      @time_passed = 0
      @zombie_count += 1
    end

    zombies = @state.scene_controller.zombies
    if zombies.length < @zombie_count
      spawn_zombie
    end
  end
end
