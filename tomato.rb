class Tomato < Player
  @@speed = 3
  def initialize(*args)
    super(*args)
    # @img = img
  end
  
  def position
    self.x = $player_x+15
    self.y = $player_y+5
  end

  def nage
      self.x += 1*@@speed
      # @tomato_x += 1*@@speed
      # Window.draw(@tomato_x, @tomato_y, @img)
    # end
  end
end