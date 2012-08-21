require 'dxruby'

Window.width = 800
Window.height = 600

map = Image.load('map.png')

Window.loop do
	break if Input.keyPush?(K_ESCAPE)
	Window.draw(0, 0, map)
end
