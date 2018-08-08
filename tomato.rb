class Tomato
  def initialize(img)
    @img = img
      # @x = 150
      # @y = 150
    $tomato_x = $main_x + 1
    $tomato_y = $main_y
  end

  def move
    $main_x.to_i.upto(1024) do
    # $main_x.upto(1024) do
    $tomato_x += 1
    end
    # $main_y
  end
    
  def draw
    Window.draw($tomato_x, $tomato_y, @img)
  end
end