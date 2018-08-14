require 'dxruby'
require_relative 'player'
require_relative 'enemy'
require_relative 'tomato'

Window.width = 512
Window.height = Window.width / 4 * 3
background = Image.load('images/green.png')
man = Player.new
img = Image.load('images/lemon.png') 
enemy = Sprite.new(430, rand(Window.height-40), img)
tmt_img = Image.load('images/tomato.png')
tmt = Tomato.new(-30, -30, tmt_img)
crash = Image.load('images/crash.png')
flug = 1
count = 0 #的にあてた回数
second = 0 #遅延用
count_down = 1860 #30秒
font = Font.new(32)
Window.loop do
  Window.draw(0,0,background)
  Window.draw_font(0, 0, "#{count_down/60}", font)
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
    if tmt.x > Window.width
      flug = 1
    elsif tmt === enemy
      flug = 1
      count += 1
    end
  end
  if tmt === enemy
    Window.draw(enemy.x-3, enemy.y-7, crash)
    second = 1
  end
  
  if second >= 1
    second += 1
  end

  if second == 10
    enemy.y = rand(Window.height-40)
    second == 0
  end
  count_down -= 1
end
