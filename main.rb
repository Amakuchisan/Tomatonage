require 'dxruby'
require_relative 'player'
require_relative 'enemy'
require_relative 'tomato'

Window.width = 512
Window.height = Window.width / 4 * 3
background = Image.load('images/green.png')

objects = []
objects << Player.new
img = Image.load('images/lemon.png')
# objects << Enemy.new(rand(1024), rand(768), img)
objects << Enemy.new(860, rand(768), img)
#spaceの回数.times do~~
# tomato << Tomato.new#ここのトマト新規作成times?
tomato_img = Image.load('images/tomato.png')
# tomato = []

Window.loop do
  Window.draw(0,0,background)
  break if Input.key_push?(K_ESCAPE)
  objects.each do |obj|
    obj.move
    obj.draw
  end
  # if Input.keyPush?(K_SPACE)
  # # if Input.keyPush?(K_SPACE) == true then
  #   for i in 0..2 do # iを0から9まで変えながらループ
  #     if $tomato_x.to_i <= 1024 then #書き方
  #       $tomato_x += 1
  #       # $tomato_y[i] += 1
  #       break # 弾を飛ばしたらループを中断する
  #     end
  #   end
  # end
  if Input.key_push?(K_SPACE) then
    tmt = tomato.new(tomato_img)
    tmt.move
    tmt.draw
  end
end
