class MenuState
  attr_accessor :window
  attr_accessor :custom_message

  def initialize(window)
    @window = window

    @custom_message = ''

    @font_size = 40
    @font = Gosu::Font.new(@window, Gosu::default_font_name, @font_size)

    @menu_items = [
      'new game',
      'quit'
    ]
    @current_item = 0

    if window.current_game_state.class == PlayingState
      @menu_items.insert(0, 'resume')
    end
  end

  def execute_action(action)
    case action
    when 'resume'
      GameWindow.instance.pop_state!
    when 'new game'
      GameWindow.instance.new_game!
    when 'quit'
      GameWindow.instance.close
    end
  end

  def button_down(id)
    case id
    when Gosu::Button::KbUp then
      if @current_item > 0
        @current_item -= 1
      end
    when Gosu::Button::KbDown then
      if @current_item < @menu_items.length - 1
        @current_item += 1
      end
    when Gosu::Button::KbReturn then
      execute_action(@menu_items[@current_item])
    end
  end

  def draw
    @font.draw(@custom_message, 20, 20, 0)

    y_offset = 50

    @menu_items.each_with_index do |item, i|
      @font.draw(item, @font_size*3, (i * @font_size) + y_offset, 0)
    end

    @font.draw('>', @font_size*2, (@current_item * @font_size) + y_offset+4, 0)
  end

  def update(dt)
  end
end
