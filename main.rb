require 'dxruby'
require_relative 'player'
require_relative 'enemy'
require_relative 'tomato'

Window.width = 512
Window.height = Window.width / 4 * 3

background = Image.load('images/green.png')
start = Image.load('images/start.png')
explain = Image.load('images/explain.png')
ending = Image.load('images/ending.png')
otsukare = Image.load('images/otsukare.png')

man_img = Image.load('images/man.png')
man = Player.new(100, 100, man_img)
img = Image.load('images/lemon.png') 
enemy = Sprite.new(430, rand(Window.height-40), img)
tmt_img = Image.load('images/tomato.png')
tmt = Tomato.new(-30, -30, tmt_img)
crash = Image.load('images/crash.png')

count = 0 #的にあてた回数
second = 0 #遅延用
flag = 1
count_down = 60*10+60 #30秒
font = Font.new(32)
font_ending = Font.new(64)

#スタート画面
Window.loop do
  Window.draw(0, 0, start)
  if Input.key_push?(K_ESCAPE)
    flag = 0
    break
  end
  break if Input.key_push?(K_RETURN)
end

#説明画面
if flag == 1
  Window.loop do
    if Input.key_push?(K_ESCAPE)
      flag = 0
      break
    end
    Window.draw(0, 0, explain)
    break if Input.key_push?(K_RETURN)
  end
end

#ゲーム画面
if flag == 1
  Window.loop do
    Window.draw(0,0,background)
    
    Window.draw_font(0, 0, "#{count_down/60}", font)
    break if Input.key_push?(K_ESCAPE) || flag == 2
    man.update
    man.draw
    enemy.draw
    if Input.key_push?(K_SPACE) && flag != 0
      flag = 0
      tmt.position
    end
    tmt.nage
    if flag == 0
      tmt.draw
      if tmt.x > Window.width
        flag = 1
      elsif tmt === enemy
        flag = 1
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
    if count_down/60 == 0
      flag = 2
      count_down = 60*10+60
    end
  end
end

#結果画面
if flag == 2
  count_down = 60*3+60
  Window.loop do
    Window.draw(0, 0, ending)
    break if Input.key_push?(K_ESCAPE) || Input.key_push?(K_RETURN)
    if count_down < 180
      Window.draw_font(400, 130, "#{count}", font_ending)
    end
    if count_down < 110
      Window.draw(0, 0, otsukare)
    else
      count_down -= 1
    end
  end
end