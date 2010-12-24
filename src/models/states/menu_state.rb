class MenuState
  attr_accessor :window

  def initialize(window)
    @window = window

    @font = Gosu::Font.new(@window, Gosu::default_font_name, 20)

    @menu_items = [
      'new game',
      'quit'
    ]

    if window.current_game_state.class.to_s == 'PlayingState'
      @menu_items.insert(0, 'resume')
    end
  end

  def button_down(id)
    case id
    when Gosu::Button::KbM then
      GameWindow.instance.pop_state
    end
  end

  def draw
    @menu_items.each_with_index do |item, i|
      @font.draw(item, 20, i * 20, 0)
    end
  end

  def update(dt)
  end
end
