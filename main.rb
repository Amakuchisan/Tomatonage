require 'dxruby'
require_relative 'player'
require_relative 'enemy'
require_relative 'tomato'
require_relative 'item'

Window.width = 512
Window.height = Window.width / 4 * 3

background = Image.load('images/green.png')
start = Image.load('images/start.png')
explain = Image.load('images/explain.png')
ending = Image.load('images/ending.png')
otsukare = Image.load('images/otsukare.png')
man_img = Image.load('images/man.png')
img = Image.load('images/lemon.png') 
tmt_img = Image.load('images/tomato.png')
crash = Image.load('images/crash.png')

man = Player.new(100, 100, man_img)
enemy = Sprite.new(430, rand(Window.height-40), img)
tmt = Tomato.new(-30, -30, tmt_img)

#アイテム
item_img = Image.load('images/shoes.png')
item = Item.new(rand(Window.width-40), rand(Window.height-40), item_img)

#敵に当てた回数
count = 0
#遅延の秒数を数える
second = 0
#場面用のフラグ
flag = 1
#アイテム用フラグ 1のとき発生
item_flag = 1

#制限時間
count_down = 60*30+60 #30秒

#走る速さの制限時間
man_speed_count = 0

#フォント
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
    
    
    #人がアイテムに触れたとき
    if man === item
      man_speed_count = 60*5
      item_flag = 0
      item.x, item.y = rand(Window.width-40), rand(Window.height-40)
    end

    if man_speed_count > 0
      $man_speed = 3
      man_speed_count -= 1
    end

    if man_speed_count == 0
      $man_speed = 1
    end
    
    #アイテムが発生するとき
    if item_flag == 1
      item.draw
    else
      if count_down % (60*5) == 0
        item_flag = rand(0..1)
      end
    end
    
    #トマトが敵に当たったとき
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

    if count_down == 0
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
    #段階的に表示されるようにした
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