class Player < Sprite
  def initialize(*args)
    super(*args)
    $man_speed = 1
  end
    
  def update
    self.x += Input.x*$man_speed
    self.y += Input.y*$man_speed
    $player_x = self.x
    $player_y = self.y
  end
end
