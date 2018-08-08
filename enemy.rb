class Enemy
  def initialize(x, y, img)
    @img = img
    @x = x
    @y = y
  end
  def move
    @y -= 1 if Input.key_down?(K_W)
    @y += 1 if Input.key_down?(K_S)
    @x += 1 if Input.key_down?(K_D)
    @x -= 1 if Input.key_down?(K_A)
  end
  def draw
    Window.draw(@x, @y, @img)
  end
end