class Player
  def initialize
    @img = Image.load('images/man.png')
    # @imgl = Image.load('images/manl/png')#左むいた時用
    $main_x = 150
    $main_y = 150
  end
    
  def move
    $main_x += Input.x
    $main_y += Input.y
  end

  def draw
    Window.draw($main_x, $main_y, @img)
  end
end
