class Bullet < Renderable
  SPEED = 200

  def initialize(state, x, y, angle, origin)
    @state = state
    @window = @state.window
    @image = Gosu::Image.new(@window, 'media/bullet.png', false)
    @angle = angle
    @origin = origin
    @x = x
    @y = y

    @state.scene_controller.register(self)
  end

  def update(dt)
    @x += Gosu::offset_x(@angle, SPEED) * dt
    @y += Gosu::offset_y(@angle, SPEED) * dt

    @state.scene_controller.objects.each do |object|
      if collides_with? object
        if object.class == Zombie
          @origin.handle_event Event.new(:game_killed_zombie)
          object.destroy!
          destroy!
        end
        if object.class == InvisibleWall
          destroy!
        end
      end
    end
  end

  def destroy!
    @state.scene_controller.deregister(self)
  end
end
