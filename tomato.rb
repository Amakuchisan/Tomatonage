class Tomato
  @@speed = 3
  def initialize(img)
    @img = img
  end
  
  def nage
    @tomato_x = $main_x+10
    @tomato_y = $main_y+5

    while @tomato_x.to_i < 500
      @tomato_x += 20
      Window.draw(@tomato_x, @tomato_y, @img)
      # Window.caption = Window.real_fps.to_s #fpsが表示される
    end
  end
  
  # def draw
  #   Window.draw(@tomato_x, @tomato_y, @img)
  # end
end
#   def move
#     if Input.key_down?(K_SPACE) == true
#       for i in 0..2 do
#         while @tomato_x <= Window.width do
#         # $main_x.upto(Window.width) do |tmt|
#         # $main_x.upto(1024) do
#           @tomato_x += 1
#         break
#         end
#       end
#     end
#   end
    
#   def draw
#     if Input.key_down?(K_SPACE)
#       while self.move
#       Window.draw(@tomato_x, @tomato_y, @img)
#       end
#     end
#   end