class Tomato
  @@speed = 3
  def initialize(img)
    @img = img
  end
  
  def position
    @tomato_x = $main_x+15
    @tomato_y = $main_y+5#koko
  end

  def nage
    if $flug == 0
      @tomato_x += 1*@@speed
      Window.draw(@tomato_x, @tomato_y, @img)
      if @tomato_x > 420
        $flug = 1
      end
    end
  end
  
  # def draw
  #   while $flug == 0
  #   Window.draw(@tomato_x, @tomato_y, @img)
  #   end
  # end
end