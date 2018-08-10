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
objects << Enemy.new(430, rand(430*3/4), img)
#spaceの回数.times do~~
# tomato << Tomato.new#ここのトマト新規作成times?
tomato_img = Image.load('images/tomato.png')
# tomato = []

tmt = Tomato.new(tomato_img)
Window.loop do
  Window.draw(0,0,background)
  break if Input.key_push?(K_ESCAPE)
  objects.each do |obj|
    obj.move
    obj.draw
  end

  if Input.key_push?(K_SPACE)
    tmt.nage
    # tmt.draw
  end
    # tmt.move
    # tmt.draw
end
