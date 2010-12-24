class MenuState
  include Singleton
  include KeyboardActions

  attr_accessor :window

  def initialize
    @font = nil
    @window = nil

    @menu_items = [
      'new game',
      'quit'
    ]
  end

  def setup(window)
    @window = window
    @font = Gosu::Font.new(@window, Gosu::default_font_name, 20)
  end

  def draw
    @menu_items.each_with_index do |item, i|
      @font.draw(item, 20, i * 20, 0)
    end
  end

  def update(dt)
  end
end
