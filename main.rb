require 'dxruby'
require_relative 'player'
require_relative 'enemy'
require_relative 'tomato'

Window.width = 512
Window.height = Window.width / 4 * 3
background = Image.load('images/green.png')
man = Player.new
img = Image.load('images/lemon.png') 
enemy = Sprite.new(430, 100, img)
tmt_img = Image.load('images/tomato.png')
tmt = Tomato.new(-30, -30, tmt_img)
crash = Image.load('images/crash.png')
flug = 1
font = Font.new(32)
Window.loop do
  Window.draw(0,0,background)
  break if Input.key_push?(K_ESCAPE)
  man.move
  man.draw
  enemy.draw
  if Input.key_push?(K_SPACE) && flug != 0
    flug = 0
    tmt.position
  end
  tmt.nage
  if flug == 0
    tmt.draw
    if tmt.x > Window.width || tmt === enemy
      flug = 1
    end
  end
  
  if tmt === enemy
    Window.draw(enemy.x-3, enemy.y-7, crash)
  end
  
end
