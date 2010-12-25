class KeyboardController
  attr_accessor :window

  def initialize(state)
    @listeners = []
    @state = state
    @window = @state.window
  end

  def register(object)
    @listeners << object
  end

  def deregister(object)
    @listeners.delete object
  end

  def send_event(name)
    event = Event.new(name)
    @listeners.each do |l|
      l.handle_event(event)
    end
  end

  def update(dt)
    if @window.button_down? Gosu::Button::KbLeft or @window.button_down? Gosu::Button::GpLeft then
      event = Event.new(:kb_left_down, :dt => dt)
      @listeners.each do |l|
        l.handle_event(event)
      end
    end
    if @window.button_down? Gosu::Button::KbRight or @window.button_down? Gosu::Button::GpRight then
      event = Event.new(:kb_right_down, :dt => dt)
      @listeners.each do |l|
        l.handle_event(event)
      end
    end
    if @window.button_down? Gosu::Button::KbUp or @window.button_down? Gosu::Button::GpButton0 then
      event = Event.new(:kb_up_down, :dt => dt)
      @listeners.each do |l|
        l.handle_event(event)
      end
    end
    if @window.button_down? Gosu::Button::KbDown then
      event = Event.new(:kb_down_down, :dt => dt)
      @listeners.each do |l|
        l.handle_event(event)
      end
    end
  end
end
