module KeyboardActions
  def button_down(id)
    case id
      when Gosu::Button::KbEscape then
        close
      when Gosu::Button::KbSpace then
        KeyboardController.instance.send_event(:kb_space_down)

      when Gosu::Button::KbM then
        if @state_stack.last != MenuState.instance
          @state_stack << MenuState.instance
        end
    end
  end
end

class KeyboardController
  include Singleton

  attr_accessor :window
  def initialize
    @listeners = []
    @window = nil
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
