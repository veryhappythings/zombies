class MenuState
  attr_accessor :window

  def initialize(window)
    @window = window

    @font = Gosu::Font.new(@window, Gosu::default_font_name, 20)

    @menu_items = [
      'new game',
      'quit'
    ]
    @current_item = 0

    if window.current_game_state.class.to_s == 'PlayingState'
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
    @menu_items.each_with_index do |item, i|
      @font.draw(item, 20, i * 20, 0)
    end

    @font.draw('>', 5, @current_item * 20, 0)
  end

  def update(dt)
  end
end
