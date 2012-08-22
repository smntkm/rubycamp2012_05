# coding: utf-8

class Player
  def initialize(map, x = 250, y = 25)
    @map = map
    @x = x
    @y = y
    @pos = 0.0
    img_file = File.join(File.dirname(__FILE__), "..", "..", "images", "player.png")
    @img = Image.load(img_file)
    @step = 0.1
    @score = 0
  end

  def move(counter)
    @pos += @step
    @x, @y = @map.get_point_pos(@pos.to_i)
    if @pos.to_i == @map.points.size - 1 #13
			#pos = @pos.to_i % (@map.points.size -1)
			
      #Scene.set_scene(:ending)
    end
    return counter - @step.abs
  end

  def check_event flag
    @map.points[@pos.to_i].event flag
  end

  def draw
    Window.draw(@x, @y, @img)
  end
end
