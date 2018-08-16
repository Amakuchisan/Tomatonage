class Tomato < Player
  @@speed = 3
  def initialize(*args)
    super(*args)
  end
  
  def position
    self.x = $player_x+15
    self.y = $player_y+5
  end

  def nage
      self.x += 1*@@speed
  end
end