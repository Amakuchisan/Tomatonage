require 'dxruby'
require_relative 'player'
require_relative 'enemy'
require_relative 'tomato'

Window.width = 512
Window.height = Window.width / 4 * 3
background = Image.load('images/green.png')
man = Player.new
img = Image.load('images/lemon.png') 
enemy = Enemy.new(430, rand(430*3/4), img)
tmt = Tomato.new(Image.load('images/tomato.png'))
Window.loop do
  Window.draw(0,0,background)
  break if Input.key_push?(K_ESCAPE)
  man.move
  man.draw
  enemy.move
  enemy.draw
  if Input.key_push?(K_SPACE) && $flug != 0
    $flug = 0
    tmt.position
  end
  tmt.nage
end
