# coding: utf-8

class Player
  attr_accessor :map, :pos
  
  def initialize(map)
    @map = map
    @pos = rand(30)
    @x, @y = @map.get_point_pos(@pos.to_i)
    img_file = File.join(File.dirname(__FILE__), "..", "..", "images", "player.png")
    @img = Image.load(img_file)
    #@step = 0.1
  end

<<<<<<< HEAD
  def move(counter, direction)
    # 十字キーの入力を待つ
    # 十字キーの方向に対応する位置へ移動する
		case direction 
		when 0
      p point = @map.points[@pos.to_i].ref_point[0]
			@x, @y = point.x, point.y
		when 1
			p @map.points[@pos.to_i].ref_point[1].class
			@x, @y = point.x, point.y
		when 2
			p point = @map.points[@pos.to_i].ref_point[2]
			@x, @y = point.x, point.y
		when 3
			p point = @map.points[@pos.to_i].ref_point[3]
			@x, @y = point.x, point.y
		end
		@pos += 1
    #@x, @y = @map.get_point_pos(@pos.to_i)
    #if @pos.to_i == @map.points.size - 1
			#@pos = @pos.to_i % (@map.points.size -1)
			
      #Scene.set_scene(:ending)
    #end
    return counter - 1
=======
  def move(counter)
    @pos += @step
	@pos -= @map.points.length if @pos >= @map.points.length
    @x, @y = @map.get_point_pos(@pos.to_i)
    if @pos.to_i == @map.points.size - 1 #13
	#@pos = @pos.to_i % (@map.points.size -1)
	#Scene.set_scene(:ending)
    end
    return counter - @step.abs
>>>>>>> e9afa3ef4ac9762ff2b11b2230999f3f13e1ab15
  end

  def check_event flag
    @map.points[@pos.to_i].event flag
  end

  def draw
    Window.draw(@x, @y, @img)
  end
end
